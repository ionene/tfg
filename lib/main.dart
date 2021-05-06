import 'package:flutter/material.dart';

import 'package:tfg_ione/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ione App',
      initialRoute: 'home',
      routes: getAppRoutes(),
    );
  }
}
