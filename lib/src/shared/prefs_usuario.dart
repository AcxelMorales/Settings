import 'package:shared_preferences/shared_preferences.dart';

class PrefsUsuario {
  static final PrefsUsuario _instance = PrefsUsuario._internal();

  factory PrefsUsuario() {
    return _instance;
  }

  PrefsUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET & SET
  // Genero
  get genero {
    return this._prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    this._prefs.setInt('genero', value);
  }

  // Theme
  get color {
    return this._prefs.getBool('color') ?? false;
  }

  set color(bool value) {
    this._prefs.setBool('color', value);
  }

  // User
  get nombreUser {
    return this._prefs.getString('nombreUser') ?? '';
  }

  set nombreUser(String value) {
    this._prefs.setString('nombreUser', value);
  }

  // Last Page
  get lastPage {
    return this._prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    this._prefs.setString('lastPage', value);
  }
}
