import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteService {
  static category(main) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"delete_main","main":"' + main + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    print(requestUrl);
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    return true;
  }

  static subCategory1(main, sub1) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"delete_sub1","main":"' + main + '","sub1":"' + sub1 + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    print(requestUrl);
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    return true;
  }

  static subCategory2(main, sub1, sub2) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"delete_sub2","main":"' + main + '","sub1":"' + sub1 + '":"sub2":"' + sub2 + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;
    print(requestUrl);
    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    print(response);
    return true;
  }
}
