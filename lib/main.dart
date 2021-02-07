import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/helpers/active.dart';
import 'package:myapp/screens/accepts/accept_screen.dart';
import 'package:myapp/screens/complains/complain_screen.dart';
import 'package:myapp/screens/login/login_screen.dart';
import 'package:myapp/screens/notifications/notification_screen.dart';
import 'package:myapp/screens/posts/post_screen.dart';
import 'package:myapp/screens/services/service_screen.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 90.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  MyApp() {
    final currentRoute = window.location.href.replaceAll(RegExp(window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/#/'), '');
    if (currentRoute == '')
      Active.route = 'posts';
    else
      Active.route = currentRoute;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arabic',
      ),
      builder: EasyLoading.init(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/posts': (context) => PostScreen(),
        '/accepts': (context) => AcceptScreen(),
        '/complains': (context) => ComplainScreen(),
        '/services': (context) => ServiceScreen(),
        '/notifications': (context) => NotificationScreen(),
      },
    );
  }
}
