import 'package:flutter/material.dart';
// import 'package:myapp/screens/posts/fragments/events.dart';
// import 'package:myapp/screens/posts/fragments/funeral.dart';
// import 'package:myapp/screens/posts/fragments/images.dart';
// import 'package:myapp/screens/posts/fragments/news.dart';
// import 'package:myapp/screens/posts/fragments/sports.dart';
// import 'package:myapp/screens/posts/fragments/wedding.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  Image image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.85 * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "إرسال الأشعار",
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
