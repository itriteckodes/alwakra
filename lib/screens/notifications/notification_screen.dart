import 'package:flutter/material.dart';
import 'package:myapp/api/Auth.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/notifications/fragments/navbar.dart';
import 'package:myapp/screens/notifications/fragments/notifications.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Image image;
  @override
  Widget build(BuildContext context) {
    // if (!Auth.check()) Navigator.pushNamed(context, '/login');
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
                  Navbar(),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 500.0,
                      child: new ListView(
                        scrollDirection: Axis.vertical,
                        children: [Notifications()],
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
