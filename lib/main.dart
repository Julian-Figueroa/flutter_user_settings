import 'package:flutter/material.dart';
import 'package:userprefs/src/pages/home_page.dart';
import 'package:userprefs/src/pages/settings_page.dart';
import 'package:userprefs/src/shared_prefs/user_preferences.dart';

void main() async{
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
