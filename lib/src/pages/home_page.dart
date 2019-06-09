import 'package:flutter/material.dart';
import 'package:userprefs/src/widgets/menu_widget.dart';
import 'package:userprefs/src/shared_prefs/user_preferences.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.color) ? Colors.indigo : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary Color: ${prefs.color}'),
          Divider(),
          Text('Genre: ${(prefs.genre == 1) ? 'Male' : 'Female'}'),
          Divider(),
          Text("User's Name: ${prefs.name}"),
          Divider(),
        ],
      ),
    );
  }
}
