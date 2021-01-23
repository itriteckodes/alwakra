import 'package:flutter/material.dart';

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
                  "الخدمات",
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
