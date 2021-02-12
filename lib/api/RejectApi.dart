import 'dart:convert';

import 'package:http/http.dart' as http;

class RejectApi {
  static submit(article, type) async {
    print(article.toString());

    var flag = 'flag=sync_data';
    var mType = 'type=reject_' + type;
    var data = 'data={"category":"'+type+'","sid":"' +
        article.sid +
        '","header":"' +
        article.header +
        '","content":"' +
        article.content +
        '","date":"' +
        article.date +
        '","username":"' +
        article.userName +
        '"}';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + mType + '&' + data;

    print('Request URL');
    print(requestUrl);

    var json;
    var response;
    try {
      json = await http.post(requestUrl);
      response = jsonDecode(json.body);
    } catch (e) {}

    print('Response');
    print(response);
    return true;
  }
}
