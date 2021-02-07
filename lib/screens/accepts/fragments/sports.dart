import 'package:flutter/material.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/models/Sport.dart';

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  Image image;

  List<Sport> photos = [];

  _SportsState() {
    getLatestArticles();
  }

  getLatestArticles() async {
    var _photos = await Api.fetchSports();
    setState(() {
      photos = _photos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.blue.withOpacity(0.25), width: 2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            'الحالة',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Arabic',
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            'التاريخ',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Arabic',
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            'المستخدم',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Arabic',
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          child: Text(
                            'عنوان الخبر',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'Arabic',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  for (var article in photos) TableRow(article: article)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TableRow extends StatelessWidget {
  const TableRow({
    Key key,
    this.article,
  }) : super(key: key);

  final Sport article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blue.withOpacity(0.25), width: 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              child: Text(
                article.approvalStatus,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: 200,
              child: Text(
                article.date,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: 200,
              child: Text(
                article.userName,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: 400,
              child: Text(
                article.content,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Arabic',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
