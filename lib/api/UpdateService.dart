import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/api/ApiService.dart';

class UpdateService {
  static category(name, old) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"update_main","new":"' + name + '","old":"' + old + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;

    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }

  static subCategory1(main, name, old) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"update_sub1","main":"' + main + '","new":"' + name + '","old":"' + old + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;

    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }

  static subCategory2(main, sub1, name, old) async {
    var flag = 'flag=sync_data';
    var type = 'type=update_service';
    var data = 'data={"flag":"update_sub2","main":"' + main + '","sub1":"' + sub1 + '","new":"' + name + '","old":"' + old + '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;

    print(requestUrl);

    var result = await http.post(requestUrl);
    var response = jsonDecode(result.body);
    return true;
  }
}
