class Content {
  var sid, content;

  Content(article) {
    sid = article['SID'] ?? "";
    content = article['content'] ?? "";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' content:' + content;
  }
}
