import 'package:flutter/material.dart';
import 'package:myapp/api/Auth.dart';
import 'package:myapp/helpers/active.dart';
import 'package:myapp/helpers/screen.dart';

class SideBarPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var size = height * width;
    var fontSize = Screen.h4();
    var pl = size * 0.000013;
    var pb = size * 0.000013;
    var pr = size * 0.000013;
    var pt = size * 0.000013;
    var iconP = width * 0.005;
    var iconSize = Screen.h4();

    return Padding(
      padding: EdgeInsets.only(left: Screen.xBlock * 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("lib/assets/madina.jpg"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'posts' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Active.route = 'posts';
                          Navigator.pushNamed(context, '/posts');
                        },
                        child: Text(
                          'الاضافات',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontFamily: 'Arabic',
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.list_alt,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'accepts' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Active.route = 'accepts';
                          Navigator.pushNamed(context, '/accepts');
                        },
                        child: Text(
                          'قبول المراسلات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.library_add_check_outlined,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'complains' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Active.route = 'complains';
                          Navigator.pushNamed(context, '/complains');
                        },
                        child: Text(
                          'الاقتراحات والشكاوي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.history_edu_outlined,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'services' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Active.route = 'services';
                          Navigator.pushNamed(context, '/services');
                        },
                        child: Text(
                          'خدمات الوكرة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.card_membership_rounded,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'notifications' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Active.route = 'notifications';
                          Navigator.pushNamed(context, '/notifications');
                        },
                        child: Text(
                          'إرسال الإخطارات',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(Active.route == 'logout' ? 0.25 : 0),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: iconP),
                      child: InkWell(
                        onTap: () {
                          Auth.logout();
                          Active.route = 'login';
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'تسجيل خروج',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: iconSize,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
