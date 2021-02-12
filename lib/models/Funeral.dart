class Funeral {
  var sid, header, content, userName, date, approvalStatus, buryDate, buryTime, burryAddress, consolationDate, menAddress, menLocation, menMobile,
  womenAddress, womenLocation, womenMobile;

  Funeral(article) {
    sid = article['sid'] ?? " ";
    header = article['header'] ?? " ";
    content = article['content'] ?? " ";
    userName = article['name'] ?? " ";
    date = article['timestamp'] ?? " ";
    approvalStatus = article['approval_status'] ?? " ";
    buryDate = article['bury_date'] ?? " ";
    buryTime = article['bury_time'] ?? " ";
    burryAddress = article['bury_address'] ?? " ";
    consolationDate = article['consolation_date'] ?? " ";
    menAddress = article['men_address'] ?? " ";
    menLocation = article['men_location'] ?? " ";
    menMobile = article['men_mobile'] ?? " ";
    womenAddress = article['women_address'] ?? " ";
    womenLocation = article['women_location'] ?? " ";
    womenMobile = article['women_mobile'] ?? " ";
  }

  @override
  String toString() {
    return 'sid : ' + sid + ' header:' + header + ' content:' + content + ' userName:' + userName + ' date:' + date + ' approvalStatus:' + approvalStatus;
  }
}
