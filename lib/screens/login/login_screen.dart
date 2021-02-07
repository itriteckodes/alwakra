import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/api/Auth.dart';
import 'package:myapp/helpers/active.dart';
import 'package:myapp/screens/posts/fragments/news.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StatefulWidget selectedFragment = News();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  var error = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Await the http get response, then decode the json-formatted response.

  @override
  Widget build(BuildContext context) {
    // if (Auth.check()) Navigator.pushNamed(context, '/posts');

    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.height;

    var size = height * width;

    var fontSize = size * 0.000013;
    var pl = width * 0.2;
    var pb = height * 0.2;
    var pr = width * 0.2;
    var pt = height * 0.2;
    var iconP = width * 0.005;
    var iconSize = width * 0.015;
    print(error);
    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("lib/assets/madina.jpg"),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(pl, pt, pr, pb),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تسجيل الدخول",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: "Arabic",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                !error
                    ? Error()
                    : SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: userNameController,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'اسم المستخدم',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: passwordController,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: 'كلمه السر',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Material(
                  child: InkWell(
                    onTap: () async {
                      if (!Api.validateLogin(userNameController.text, passwordController.text)) {
                        EasyLoading.showError("Please fill all fields");
                        return;
                      }
                      var login = await Api.submitLogin(userNameController.text, passwordController.text);
                      setState(() {
                        error = login;
                      });
                      if (login) {
                        Active.route = 'posts';
                        Navigator.pushNamed(context, '/posts');
                      }
                    },
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(60, 6, 60, 6),
                          child: Text(
                            'تسجيل الدخول',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Arabic',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'بريد أو كلمة مرورغير صحيحة',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontFamily: 'Arabic',
          ),
        ),
      ],
    );
  }
}
