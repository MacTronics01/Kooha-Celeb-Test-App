import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedPreference extends ChangeNotifier {
  final String onBoardingCompletedKey = 'onBoardingCompleted';
  static const String loggedIn = 'isLoggedIn';
  static const String userSetPinKey = 'userSetPin';
  static const String userInfoKey = 'userInfoKey';
  static const String themeMode = 'isDarkMode';
  final String emailKey = 'emailKey';
  final String passwordKey = 'password';
  final String tokenKey = 'token';
  final String nameKey = 'name';
  final String firstNameKey = 'firstName';
  final String pinKey = 'pin';

// for the theme
  void setTheme(bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(themeMode, value.toString());
    notifyListeners();
  }
  /// get user password
  Future<bool> getTheme() async {
    prefs = await SharedPreferences.getInstance();
    String value=  prefs!.getString(themeMode) ?? '';
    if(value != "true"){
      return false;
    }
    else{
      return true;
    }
  }
}
