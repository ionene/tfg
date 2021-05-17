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
    return _prefs.getString('lastPage') ?? 'login';
  }

  set initialPage(String initialPage) {
    _prefs.setString('lastPage', initialPage);
  }

  get completedExercises {
    return _prefs.getStringList('completedExercises') ?? '';
  }

  set completedExercises(String completedExercises) {
    _prefs.setString('completedExercises', completedExercises);
  }
}