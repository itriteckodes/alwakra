import 'package:flutter/material.dart';
import 'package:myapp/layout/sidebar.dart';
import 'package:myapp/screens/complains/fragments/navbar.dart';
import 'package:myapp/screens/complains/fragments/suggestions.dart';

class ComplainScreen extends StatefulWidget {
  ComplainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  StatefulWidget selectedFragment = Suggestions();
  @override
  Widget build(BuildContext context) {
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
                      child: new ListView(
                        scrollDirection: Axis.vertical,
                        children: [selectedFragment],
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
