import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/Content.dart';
import 'dart:convert';

import 'package:myapp/models/Service.dart';
import 'package:myapp/models/SubCategory1.dart';
import 'package:myapp/models/SubCategory2.dart';

class ApiService {
  static var selectedCategory;
  static var selectedSubCategory1;
  static var selectedSubCategory2;

  static fetchServices() async {
    EasyLoading.show(status: 'Please Wait');
    List<Service> articles = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_services';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);
    if (response != null) {
      for (var i = 0; i < response.length; i++) {
        if (!ApiService.categoryExists(articles, response[i])) articles.add(Service(response[i]));
      }
      selectedCategory = null;
      selectedSubCategory1 = null;
      selectedSubCategory2 = null;
    }
    EasyLoading.dismiss();
    return articles;
  }

  static fetchSub1() async {
    EasyLoading.show(status: 'Please Wait');
    List<SubCategory1> articles = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_services';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);
    print(response);
    if (response != null)
      for (var i = 0; i < response.length; i++) {
        if (response[i]['main'] == selectedCategory.main) {
          if (!ApiService.subCategory1Exists(articles, response[i])) {
            if (response[i]['sub1'] != '  ' && response[i]['sub1'] != ' ' && response[i]['sub1'] != '') articles.add(SubCategory1(response[i]));
          }
        }
      }
    selectedSubCategory1 = null;
    selectedSubCategory2 = null;
    EasyLoading.dismiss();
    return articles;
  }

  static fetchSub2() async {
    EasyLoading.show(status: 'Please Wait');
    List<SubCategory2> articles = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_services';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);
    if (response != null)
      for (var i = 0; i < response.length; i++) {
        if (response[i]['main'] == selectedCategory.main && response[i]['sub1'] == selectedSubCategory1.sub1) {
          if (!ApiService.subCategory2Exists(articles, response[i])) {
            if (response[i]['sub2'] != '  ' && response[i]['sub2'] != ' ' && response[i]['sub2'] != '') articles.add(SubCategory2(response[i]));
          }
        }
      }

    EasyLoading.dismiss();
    return articles;
  }

  static fetchContent() async {
    EasyLoading.show(status: 'Please Wait');
    Content article;

    var flag = 'flag=sync_data';
    var type = 'type=get_service';
    var data = 'data={' + ApiService.selectedSubCategory2.sid + '}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    print(requestUrl);
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    print(response);

    if (response != null) article = response['content'];
    EasyLoading.dismiss();
    return article;
  }

  static addCategory(name) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"add_main","main":"' + name + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;

    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }

  static addSubCategory1(name) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"add_sub1","main":"' + ApiService.selectedCategory.main + '","sub1":"' + name + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }

  static addSubCategory2(name) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"add_sub2","main":"' + ApiService.selectedCategory.main + '","sub1":"' + ApiService.selectedSubCategory1.sub1 + '","sub2":"' + name + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    print(requestUrl);
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    return true;
  }

  static addContent(name) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"add_content","main":"' +
        ApiService.selectedCategory.main +
        '","sub1":"' +
        ApiService.selectedSubCategory1.sub1 +
        '","sub2":"' +
        ApiService.selectedSubCategory2.sub2 +
        '","content":"' +
        name +
        '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }

  static validateCategory(
    header,
  ) {
    if (header == '')
      return false;
    else
      return true;
  }

  static validateSubCategory1(header) {
    if (selectedCategory == null) {
      EasyLoading.showError('Please select a service');
      return false;
    } else if (header == '') {
      EasyLoading.showError("Please fill all fields");
      return false;
    } else
      return true;
  }

  static validateSubCategory2(header) {
    if (selectedCategory == null) {
      EasyLoading.showError('Please select a service');
      return false;
    } else if (selectedSubCategory1 == null) {
      EasyLoading.showError("Please select a Ctegory");
      return false;
    } else if (header == '') {
      EasyLoading.showError("Please fill all fields");
      return false;
    } else
      return true;
  }

  static validateContent(header) {
    if (selectedCategory == null) {
      EasyLoading.showError('Please select a service');
      return false;
    } else if (selectedSubCategory1 == null) {
      EasyLoading.showError("Please select a SubCategory 1");
      return false;
    } else if (selectedSubCategory2 == null) {
      EasyLoading.showError("Please select a SubCategory 2");
      return false;
    } else if (header == '') {
      EasyLoading.showError("Please fill all fields");
      return false;
    } else
      return true;
  }

  static bool categoryExists(list, mArticle) {
    for (var article in list) if (article.main == mArticle['main']) return true;
    return false;
  }

  static bool subCategory1Exists(list, mArticle) {
    for (var article in list) if (article.sub1 == mArticle['sub1']) return true;
    return false;
  }

  static bool subCategory2Exists(list, mArticle) {
    for (var article in list) if (article.sub2 == mArticle['sub2']) return true;
    return false;
  }
}
