import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/api/Auth.dart';

class AcceptApi {
  static news(article) async {
    print(article.toString());

    var flag = 'flag=sync_data';
    var type = 'type=accept_news';
    var data = 'data="{"category":"news","sid":"' +
        article.sid +
        '","header":"' +
        article.header +
        '","content":"' +
        article.content +
        '":"date":"' +
        article.date +
        '","username":"' +
        Auth.userName() +
        '"}"';
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?' + flag + '&' + type + '&' + data;

    print('Request URL');
    print(requestUrl);
    
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    print('Response');
    print(response);
    return true;
  }
}
