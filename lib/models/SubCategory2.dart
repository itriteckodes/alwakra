class SubCategory2 {
  var sid, main, sub1, sub2, mainImage, sub1Image, sub2Image, images, location;

  SubCategory2(article) {
    sid = article['SID'] ?? "";
    main = article['main'] ?? "";
    sub1 = article['sub1'] ?? "";
    sub2 = article['sub2'] ?? "";
    mainImage = article['main_image'] ?? "";
    sub1Image = article['sub1_image'] ?? "";
    sub2Image = article['sub2_image'] ?? "";
    images = article['images'] ?? "";
    location = article['location'] ?? "";
  }

  @override
  String toString() {
    return 'sid : ' +
        sid +
        ' main:' +
        main +
        ' sub1:' +
        sub1 +
        ' sub2:' +
        sub2 +
        ' mainImage:' +
        mainImage +
        ' sub1Image:' +
        sub1Image +
        ' sub2Image:' +
        sub2Image +
        ' images:' +
        images +
        ' location:' +
        location;
  }
}
