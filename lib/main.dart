import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tfg_ione/preferences/main_preferences.dart';

import 'package:tfg_ione/src/routes/routes.dart';



void main() async {

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _prefs = MainPreferences();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikastruk',
      initialRoute: _prefs.initialPage,
      routes: getAppRoutes(),
    );
  }
}
