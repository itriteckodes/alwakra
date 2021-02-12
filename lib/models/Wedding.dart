class Wedding {
  var sid, header, content, userName, date, approvalStatus, groom, father, mobile, image, location, address;

  Wedding(article) {
    sid = article['sid'] ?? " ";
    header = article['header'] ?? " ";
    content = article['content'] ?? " ";
    userName = article['username'] ?? " ";
    date = article['date'] ?? " ";
    approvalStatus = article['approval_status'] ?? " ";
    groom = article['groom'] ?? " ";
    father = article['father'] ?? " ";
    mobile = article['mobile'] ?? " ";
    image = article['image'] ?? " ";
    location = article['location'] ?? " ";
    location = article['address'] ?? " ";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' header:' + header + ' content:' + content + ' userName:' + userName + ' date:' + date + ' approvalStatus:' + approvalStatus;
  }
}
