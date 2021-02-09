import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/helpers/screen.dart';
import 'package:myapp/layout/sidebarpop.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Image image;
  _NavbarState();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 85,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "الخدمات",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Screen.navTitle(),
                    fontFamily: "Arabic",
                  ),
                ),
              ),
            ),
          ),
          if (Screen.isMobile() || Screen.isLandScape() || Screen.isTablet())
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SideBarPop();
                        });
                  },
                  child: Icon(
                    FontAwesomeIcons.ellipsisV,
                    size: Screen.navTitle(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
