import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;

  TitleComponent({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title, 
        style: TextStyle(        
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}