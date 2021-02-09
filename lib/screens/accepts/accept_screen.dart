import 'package:flutter/material.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/accepts/fragments/navbar.dart';
import 'package:myapp/screens/accepts/fragments/news.dart';
import 'package:myapp/helpers/screen.dart';

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
    Screen().init(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    height: 50,
                    width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 85,
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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: selectedFragment,
                  ),
                ],
              ),
            ),
            if (!Screen.isMobile() && !Screen.isLandScape() && !Screen.isTablet()) SideBar(),
          ],
        ),
      ),
    );
  }
}
