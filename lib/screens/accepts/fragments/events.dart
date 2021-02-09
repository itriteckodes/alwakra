import 'package:flutter/material.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/models/Event.dart';
import 'package:myapp/helpers/screen.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Image image;

  List<Event> events = [];

  _EventsState() {
    getLatestArticles();
  }

  getLatestArticles() async {
    var _events = await Api.fetchEvents();
    setState(() {
      events = _events;
    });
  }

  @override
  Widget build(BuildContext context) {
    Screen().init(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.yBlock * 74 : Screen.yBlock * 80,
        width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 30),
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
                        width: Screen.smCol(),
                        child: Text(
                          'الحالة',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.black, fontSize: Screen.headFont(), fontFamily: 'Arabic', fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: Screen.smCol(),
                        child: Text(
                          'التاريخ',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.black, fontSize: Screen.headFont(), fontFamily: 'Arabic', fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: Screen.smCol(),
                        child: Text(
                          'المستخدم',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.black, fontSize: Screen.headFont(), fontFamily: 'Arabic', fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: Screen.lgCol(),
                        child: Text(
                          'عنوان الخبر',
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.black, fontSize: Screen.headFont(), fontFamily: 'Arabic', fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                for (var article in events) TableRow(article: article)
              ],
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

  final Event article;

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
              width: Screen.smCol(),
              child: Text(
                article.approvalStatus,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Screen.tableRowFont(),
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: Screen.smCol(),
              child: Text(
                article.date,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Screen.tableRowFont(),
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: Screen.smCol(),
              child: Text(
                article.userName,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Screen.tableRowFont(),
                  fontFamily: 'Arabic',
                ),
              ),
            ),
            Container(
              width: Screen.lgCol(),
              child: Text(
                article.content,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Screen.tableRowFont(),
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
