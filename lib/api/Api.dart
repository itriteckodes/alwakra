import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/api/Auth.dart';
import 'package:myapp/models/Article.dart';
import 'package:myapp/models/Complain.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:myapp/models/Event.dart';
import 'package:myapp/models/Funeral.dart';
import 'package:myapp/models/Photo.dart';
import 'package:myapp/models/Sport.dart';
import 'package:myapp/models/Wedding.dart';

class Api {
  static fetchNews() async {
    EasyLoading.show(status: 'Please Wait');
    List<Article> articles = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);
    if (response['news'] != null)
      for (var i = 0; i < response['news'].length; i++) {
        articles.add(Article(response['news'][i]));
      }
    EasyLoading.dismiss();
    return articles;
  }

  static fetchEvents() async {
    EasyLoading.show(status: 'Please Wait');
    List<Event> events = [];
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['events'] != null)
      for (var i = 0; i < response['events'].length; i++) {
        events.add(Event(response['events'][i]));
      }
    EasyLoading.dismiss();
    return events;
  }

  static fetchWeddings() async {
    EasyLoading.show(status: 'Please Wait');
    List<Wedding> weddings = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['weddings'] != null)
      for (var i = 0; i < response['weddings'].length; i++) {
        weddings.add(Wedding(response['weddings'][i]));
      }
    EasyLoading.dismiss();
    return weddings;
  }

  static fetchFunerals() async {
    EasyLoading.show(status: 'Please Wait');
    List<Funeral> funerals = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['consolations'] != null)
      for (var i = 0; i < response['consolations'].length; i++) {
        funerals.add(Funeral(response['consolations'][i]));
      }
    EasyLoading.dismiss();
    return funerals;
  }

  static fetchPhotos() async {
    EasyLoading.show(status: 'Please Wait');
    List<Photo> photos = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['photos'] != null)
      for (var i = 0; i < response['photos'].length; i++) {
        photos.add(Photo(response['photos'][i]));
      }
    EasyLoading.dismiss();
    return photos;
  }

  static fetchSports() async {
    EasyLoading.show(status: 'Please Wait');
    List<Sport> photos = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['images'] != null)
      for (var i = 0; i < response['sports'].length; i++) {
        photos.add(Sport(response['sports'][i]));
      }
    EasyLoading.dismiss();
    return photos;
  }

  static fetchComplains() async {
    EasyLoading.show(status: 'Please Wait');
    List<Complain> complains = [];

    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_suggestions';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    if (response['delete_news'] != null)
      for (var i = 0; i < response['delete_news'].length; i++) {
        complains.add(Complain(response['delete_news'][i]));
      }
    EasyLoading.dismiss();
    return complains;
  }

  static submitLogin(userName, password) async {
    EasyLoading.show(status: 'Please Wait');

    var bytes = utf8.encode(userName + '' + password);
    password = md5.convert(bytes).toString();
    var flag = 'flag=sync_data';
    var type = 'type=login';
    var data = 'data=' + userName + ';;' + password;
    print(data);
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    EasyLoading.dismiss();
    if (response['status'] == '1') {
      Auth.login(response['name']);
      return true;
    } else {
      return false;
    }
  }

  static submitNews(header, content, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_news';
    var data = 'data="{"header":"' +
        header +
        '","content":"' +
        content +
        '":"date":"' +
        DateTime.now().toString() +
        '":"images":"' +
        image +
        '","username":"' +
        Auth.userName() +
        '"}"';
    print('data :');
    print(data);
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);

    print('Response :');
    print(response);

    if (response['status'] == '1') {
      return true;
    } else {
      return false;
    }
  }

  static submitEvent(header, content, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_event';
    var data = 'data="{"header":"' +
        header +
        '","content":"' +
        content +
        '":"date":"' +
        DateTime.now().toString() +
        '":"images":"' +
        image +
        '","username":"' +
        Auth.userName() +
        '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);

    if (response['status'] == '1') {
      return true;
    } else {
      return false;
    }
  }

  static submitWedding(father, groom, location, date, address, mobile, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_event';
    var data = 'data="{"father":"' +
        father +
        '","groom":"' +
        groom +
        '":"location":"' +
        location +
        '":"date":"' +
        date +
        '":"address":"' +
        mobile +
        '":"mobile":"' +
        address +
        '","images":' +
        image +
        '}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    if (response['status'] == '1') {
      return true;
    } else {
      return false;
    }
  }

  static submitFuneral(buryDate, buryTime, burryAddress, consolationDate, menAddress, menLocation, menMobile, womenAddress, womenLocation, womenMobile, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_consolation';
    var data = 'data="{"bury_date":"' +
        buryDate +
        '":"bury_time":"' +
        buryTime +
        '":"bury_address":"' +
        burryAddress +
        '":"consolation_date":"' +
        consolationDate +
        '":"men_address":"' +
        menAddress +
        '":"men_location":"' +
        menLocation +
        '":"men_mobile":"' +
        menMobile +
        '":"women_address":"' +
        womenAddress +
        '":"women_location":"' +
        womenLocation +
        '":"women_mobile":"' +
        womenMobile +
        '","images":' +
        image +
        '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    if (response['status'] == '1') {
      return true;
    } else {
      return false;
    }
  }

  static submitSport(header, content, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_sport';
    var data = 'data="{"header":"' +
        header +
        '","content":"' +
        content +
        '":"date":"' +
        DateTime.now().toString() +
        '":"images":"' +
        image +
        '","username":"' +
        Auth.userName() +
        '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    await http.post(requestUrl);
    // var response = jsonDecode(result.body);
    return true;
  }

  static submitImages(header, content, image) async {
    var flag = 'flag=sync_data';
    var type = 'type=add_photo';
    var data = 'data="{"header":"' + header + '":"date":"' + content + '":"images":"' + image + '","username":"' + Auth.userName() + '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    await http.post(requestUrl);
    // var response = jsonDecode(result.body);
    return true;
  }

  static sendNotification(header, content) async {
    EasyLoading.show(status: 'Please Wait');
    var flag = 'flag=sync_data';
    var type = 'type=add_notification';
    var data = 'data="{"header":"' + header + '","content":"' + content + '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    EasyLoading.dismiss();
    if (response['status'] == '0') {
      return true;
    } else {
      return false;
    }
  }

  static validateLogin(userName, password) {
    if (userName == '' || password == '')
      return false;
    else
      return true;
  }

  static validateNews(header, content, image) {
    if (header == '' || content == '' || image == null)
      return false;
    else
      return true;
  }

  static validateEvent(header, content, image) {
    if (header == '' || content == '' || image == null)
      return false;
    else
      return true;
  }

  static validateWedding(father, groom, location, date, address, mobile, image) {
    if (father == '' || groom == '' || location == '' || date == '' || address == '' || mobile == '' || image == null)
      return false;
    else
      return true;
  }

  static validateFuneral(buryDate, buryTime, burryAddress, consolationDate, menAddress, menLocation, menMobile, womenAddress, womenLocation, womenMobile, image) {
    if (buryDate == '' ||
        buryTime == '' ||
        burryAddress == '' ||
        consolationDate == '' ||
        menAddress == '' ||
        menLocation == '' ||
        menMobile == '' ||
        womenAddress == '' ||
        womenLocation == '' ||
        womenMobile == '' ||
        image == null)
      return false;
    else
      return true;
  }

  //There duty

  static validateSport(header, content, image) {
    if (header == '' || content == '' || image == null)
      return false;
    else
      return true;
  }

  static validateImage(header, content, image) {
    if (header == '' || content == '' || image == null)
      return false;
    else
      return true;
  }
}
