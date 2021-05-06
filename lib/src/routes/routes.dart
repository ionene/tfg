import 'package:flutter/material.dart';

import 'package:tfg_ione/src/pages/home/home_page.dart';



Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),

  };
}