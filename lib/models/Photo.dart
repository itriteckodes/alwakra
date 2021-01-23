class Photo {
  var sid, header, content, userName, date, approvalStatus;

  Photo(photo) {
    sid = photo['sid'];
    header = photo['header'];
    content = photo['content'];
    userName = photo['username'];
    date = photo['date'];
    approvalStatus = photo['approval_status'];
  }
}
