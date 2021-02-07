import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Auth.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/screens/posts/fragments/navbar.dart';
import 'package:myapp/screens/posts/fragments/news.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  StatefulWidget selectedFragment = News();

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
                  Navbar(
                    onSelectFragment: (mSelectedFragment) => {
                      this.setState(() {
                        selectedFragment = mSelectedFragment;
                      })
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 500.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: selectedFragment,
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
