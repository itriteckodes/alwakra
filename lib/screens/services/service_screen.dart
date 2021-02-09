import 'package:flutter/material.dart';
import 'package:myapp/helpers/screen.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/services/fragments/navbar.dart';
import 'package:myapp/screens/services/fragments/services_form.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
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
              width: Screen.isMobile()||Screen.isLandScape()||Screen.isTablet() ? Screen.width : Screen.xBlock * 85,
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
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ServicesForm(),
                    ),
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
