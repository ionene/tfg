import 'package:flutter/material.dart';

import 'package:tfg_ione/src/routes/routes.dart';

import 'package:tfg_ione/preferences/main_preferences.dart';

void main() async {

  final prefs = new MainPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _prefs = MainPreferences();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikastruk',
      initialRoute: _prefs.initialPage,
      routes: getAppRoutes(),
    );
  }
}
