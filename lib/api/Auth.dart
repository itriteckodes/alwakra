// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class Auth {
  static Future login(userName) async {
    final Storage _localStorage = window.localStorage;
    _localStorage['userName'] = userName;
  }

  static check() {
    final Storage _localStorage = window.localStorage;
    if (_localStorage['userName'] != null)
      return true;
    else
      return false;
  }

  static userName() {
    final Storage _localStorage = window.localStorage;
    return _localStorage['userName'];
  }

  static Future logout() async {
    final Storage _localStorage = window.localStorage;
    _localStorage.remove('userName');
  }
}
