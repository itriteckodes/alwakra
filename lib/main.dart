import 'package:flutter/material.dart';
import 'package:myapp/helpers/active.dart';
import 'package:myapp/screens/accepts/accept_screen.dart';
import 'package:myapp/screens/complains/complain_screen.dart';
import 'package:myapp/screens/notifications/notification_screen.dart';
import 'package:myapp/screens/posts/post_screen.dart';
import 'package:myapp/screens/services/service_screen.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void main() {
  runApp(MyApp());
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
      initialRoute: '/',
      routes: {
        '/': (context) => PostScreen(),
        '/posts': (context) => PostScreen(),
        '/accepts': (context) => AcceptScreen(),
        '/complains': (context) => ComplainScreen(),
        '/services': (context) => ServiceScreen(),
        '/notifications': (context) => NotificationScreen(),
      },
    );
  }
}
