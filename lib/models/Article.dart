class Article {
  var sid, header, content, userName, date, approvalStatus;

  Article(article) {
    sid = article['sid'] ?? " ";
    header = article['header'] ?? " ";
    content = article['content'] ?? " ";
    userName = article['username'] ?? " ";
    date = article['date'] ?? " ";
    approvalStatus = article['approval_status'] ?? " ";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' header:' + header + ' content:' + content + ' userName:' + userName + ' date:' + date + ' approvalStatus:' + approvalStatus;
  }
}
