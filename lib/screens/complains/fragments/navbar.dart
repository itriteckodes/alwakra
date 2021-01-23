import 'package:flutter/material.dart';
import 'package:myapp/screens/complains/fragments/complains.dart';
import 'package:myapp/screens/complains/fragments/complements.dart';
import 'package:myapp/screens/complains/fragments/suggestions.dart';

class Navbar extends StatefulWidget {
  final onSelectFragment;
  Navbar({Key key, @required this.onSelectFragment}) : super(key: key);
  @override
  _NavbarState createState() => _NavbarState(this.onSelectFragment);
}

class _NavbarState extends State<Navbar> {
  Image image;
  var active = "suggestions";
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
                      this.onSelectFragment(Complements());
                      setState(() {
                        active = "complements";
                      });
                    },
                    child: Container(
                      decoration: active == "complements" ? menuBorder : null,
                      child: Text(
                        "الاطرائات",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "complements" ? Colors.black : Colors.black26,
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
                      this.onSelectFragment(Complains());
                      setState(() {
                        active = "complains";
                      });
                    },
                    child: Container(
                      decoration: active == "complains" ? menuBorder : null,
                      child: Text(
                        "الشقوي",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "complains" ? Colors.black : Colors.black26,
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
                      this.onSelectFragment(Suggestions());
                      setState(() {
                        active = "suggestions";
                      });
                    },
                    child: Container(
                      decoration: active == "suggestions" ? menuBorder : null,
                      child: Text(
                        "الاقتراحات",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: active == "suggestions" ? Colors.black : Colors.black26,
                          fontSize: 30,
                          fontFamily: "Arabic",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 100),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "الإكتراحت و الشقوي",
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
