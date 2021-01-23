import 'package:flutter/material.dart';
import 'package:myapp/screens/accepts/fragments/events.dart';
import 'package:myapp/screens/accepts/fragments/funeral.dart';
import 'package:myapp/screens/accepts/fragments/images.dart';
import 'package:myapp/screens/accepts/fragments/news.dart';
import 'package:myapp/screens/accepts/fragments/sports.dart';
import 'package:myapp/screens/accepts/fragments/wedding.dart';

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
  @override
  Widget build(BuildContext context) {
    var menuBorder = BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue, width: 3)));
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.85 * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(Images());
                      setState(() {
                        active = "images";
                      });
                    },
                    child: Container(
                      decoration: active == "images" ? menuBorder : null,
                      child: Text(
                        "صور",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "images" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(Sports());
                      setState(() {
                        active = "sports";
                      });
                    },
                    child: Container(
                      decoration: active == "sports" ? menuBorder : null,
                      child: Text(
                        "رياضة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "sports" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(Funeral());
                      setState(() {
                        active = "funeral";
                      });
                    },
                    child: Container(
                      decoration: active == "funeral" ? menuBorder : null,
                      child: Text(
                        "عزة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "funeral" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(Wedding());
                      setState(() {
                        active = "weddings";
                      });
                    },
                    child: Container(
                      decoration: active == "weddings" ? menuBorder : null,
                      child: Text(
                        "زفاف",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "weddings" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(Events());
                      setState(() {
                        active = "events";
                      });
                    },
                    child: Container(
                      decoration: active == "events" ? menuBorder : null,
                      child: Text(
                        "مناسبة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "events" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: InkWell(
                    onTap: () {
                      this.onSelectFragment(News());
                      setState(() {
                        active = "news";
                      });
                    },
                    child: Container(
                      decoration: active == "news" ? menuBorder : null,
                      child: Text(
                        "خبر",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "news" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "قبول المراسلات",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
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
