
import 'package:flutter/material.dart';

import 'package:tfg_ione/src/widgets/myActions.dart';

class MyAppBar extends AppBar {
  
  MyAppBar({Key key, String title, BuildContext context})
      : super(
          key: key,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: [MyActions()],
        );
}