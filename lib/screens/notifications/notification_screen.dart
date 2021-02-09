import 'package:flutter/material.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/notifications/fragments/navbar.dart';
import 'package:myapp/screens/notifications/fragments/notifications.dart';
import 'package:myapp/helpers/screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Image image;
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
                  Navbar(),
                  SizedBox(
                    height: 50,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Notifications(),
                  ),
                ],
              ),
            ),
            if(!Screen.isMobile() && !Screen.isLandScape() && !Screen.isTablet())
            SideBar(),
          ],
        ),
      ),
    );
  }
}
