import 'package:http/http.dart' as http;
import 'package:myapp/models/Article.dart';
import 'dart:convert';

import 'package:myapp/models/ram.dart';

class Api {
  static getData() async {
    var requestUrl = 'http://alwakra.com.qa/APP/login.php?flag=sync_data&type=get_pending_approval';
    var json = await http.post(requestUrl);
    var response = jsonDecode(json.body);

    List<Article> articles = [];
    for (var i = 0; i < response['news'].length; i++) {
      articles.add(Article(response['news'][i]));
    }

    // List<Photo> photos = [];
    // for (var i = 0; i < response['photos'].length; i++) {
    //   photos.add(Photo(response['photos'][i]));
    // }

    Ram.articles = articles;
  }
}
