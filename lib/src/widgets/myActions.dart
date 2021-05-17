import 'package:flutter/material.dart';
import 'package:tfg_ione/preferences/main_preferences.dart';

class MyActions extends StatelessWidget {
  final _prefs = MainPreferences();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white24,
            child: Image(
              height: 40,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/avatar/' + 'avatar.png'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    _prefs.initialPage = 'login';

    Navigator.pushReplacementNamed(context, 'login');
  }
}
