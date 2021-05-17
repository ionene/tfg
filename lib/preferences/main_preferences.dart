import 'package:shared_preferences/shared_preferences.dart';

class MainPreferences {
  static final MainPreferences _instance = MainPreferences._internal();

  factory MainPreferences() {
    return _instance;
  }

  MainPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get initialPage {
    return _prefs.getString('initialPage') ?? 'login';
  }

  set initialPage(String initialPage) {
    _prefs.setString('initialPage', initialPage);
  }


  get donePercent{
    return _prefs.getStringList('donePercent') ?? null;
  }

  set donePercent(List<String> donePercent) {
    _prefs.setStringList('donePercent', donePercent);
  }
}
