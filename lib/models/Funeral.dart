class Funeral {
  var sid, header, content, userName, date, approvalStatus;

  Funeral(article) {
    sid = article['sid'] ?? " ";
    header = article['header'] ?? " ";
    content = article['content'] ?? " ";
    userName = article['name'] ?? " ";
    date = article['timestamp'] ?? " ";
    approvalStatus = article['approval_status'] ?? " ";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' header:' + header + ' content:' + content + ' userName:' + userName + ' date:' + date + ' approvalStatus:' + approvalStatus;
  }
}
