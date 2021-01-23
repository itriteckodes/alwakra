import 'package:flutter/material.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/accepts/fragments/navbar.dart';
import 'package:myapp/screens/accepts/fragments/news.dart';
// import 'package:sizer/sizer.dart';

class AcceptScreen extends StatefulWidget {
  AcceptScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  StatefulWidget selectedFragment = News();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 50,
                  ),
                  Navbar(
                    onSelectFragment: (mSelectedFragment) => {
                      this.setState(() {
                        selectedFragment = mSelectedFragment;
                      })
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 500.0,
                      child: new ListView(
                        scrollDirection: Axis.vertical,
                        children: [selectedFragment],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
