import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/layout/sidebarpop.dart';
import 'package:myapp/screens/posts/fragments/events.dart';
import 'package:myapp/screens/posts/fragments/funeral.dart';
import 'package:myapp/screens/posts/fragments/images.dart';
import 'package:myapp/screens/posts/fragments/news.dart';
import 'package:myapp/screens/posts/fragments/sports.dart';
import 'package:myapp/screens/posts/fragments/wedding.dart';
import 'package:myapp/helpers/screen.dart';

class Navbar extends StatefulWidget {
  final onSelectFragment;
  Navbar({Key key, @required this.onSelectFragment}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState(this.onSelectFragment);
}

class _NavbarState extends State<Navbar> {
  Image image;
  var active = "news";
  final onSelectFragment;
  _NavbarState(this.onSelectFragment);

  var menuBorder = BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue, width: 3)));

  Widget navButton({widget, placeHolder, arabicName}) {
    
    return InkWell(
      onTap: () {
        this.onSelectFragment(widget);
        setState(() {
          active = placeHolder;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: Screen.xBlock * 1.5, right: Screen.xBlock * 2),
        child: Container(
          decoration: active == placeHolder ? menuBorder : null,
          child: Text(
            arabicName,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: active == placeHolder ? Colors.black : Colors.black26,
              fontSize: Screen.h3(),
              fontFamily: "Arabic",
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Screen().init(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = height * width;
    var fontSize = Screen.h3();

    var pl = size * 0.000013;
    var pr = size * 0.000013;

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                navButton(widget: Images(), placeHolder: 'images', arabicName: 'صور'),
                navButton(widget: Sports(), placeHolder: 'sports', arabicName: 'رياضة'),
                navButton(widget: Funeral(), placeHolder: 'funeral', arabicName: 'عزة'),
                navButton(widget: Weddings(), placeHolder: 'weddings', arabicName: 'زفاف'),
                navButton(widget: Events(), placeHolder: 'events', arabicName: 'مناسبة'),
                navButton(widget: News(), placeHolder: 'news', arabicName: 'خبر'),
              ],
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
            )
          else 
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: pl, left: pr),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "الاضافات",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Screen.h2(),
                    fontFamily: "Arabic",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
