import 'dart:math';

import 'package:flutter/material.dart';

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
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Image(   
                  height: 40,
                  fit: BoxFit.cover,         
                  image: AssetImage('assets/images/avatar/' + 'avatar.png'),
                ),
              ),
            ),  
          ],
        );
}