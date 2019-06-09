import 'package:flutter/material.dart';
import 'package:userprefs/src/widgets/menu_widget.dart';
import 'package:userprefs/src/shared_prefs/user_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;
  String _name;

  TextEditingController _textController;

  final _prefs = UserPreferences();

  @override
  void initState() {
    super.initState();

    _prefs.lastPage = SettingsPage.routeName;

    _genre = _prefs.genre;

    _secondaryColor = _prefs.color;

    _name = _prefs.name;

    _textController = new TextEditingController(text: _name);
  }

  _setSelectedRadio(int value) {
    _prefs.genre = value;

    _genre = value;
    setState(() {});
  }

  _setSelectedColor(bool value) {
    _prefs.color = value;

    _secondaryColor = value;
    setState(() {});
  }

  _setTypedName(String value) {
    _prefs.name = value;

    _name = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (_prefs.color) ? Colors.indigo : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary Color'),
            onChanged: _setSelectedColor,
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Female'),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: "User's name",
              ),
              onChanged: _setTypedName,
            ),
          ),
        ],
      ),
    );
  }
}
