import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get genre {
    return _prefs.getInt('genre') ?? 1;
  }

  set genre(int value) {
    _prefs.setInt('genre', value);
  }

  get color {
    return _prefs.getBool('color') ?? false;
  }

  set color(bool value) {
    _prefs.setBool('color', value);
  }

  get name {
    return _prefs.getString('name') ?? 'John';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get lastPage {
    return _prefs.getString('page') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('page', value);
  }
}
