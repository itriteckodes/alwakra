class Complain {
  var sid, header, content, timestamp, image, category, userName;

  Complain(article) {
    sid = article['sid'] ?? " ";
    header = article['header'] ?? " ";
    content = article['content'] ?? " ";
    userName = article['username'] ?? " ";
    timestamp = article['timestamp'] ?? " ";
    image = article['image'] ?? " ";
    category = article['category'] ?? " ";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' header:' + header + ' content:' + content + ' timestamp:' + timestamp + ' image:' + image + ' category:' + category;
  }
}
