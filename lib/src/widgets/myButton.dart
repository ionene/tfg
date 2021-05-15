import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double size;
  final String text;
  final IconData icon;
  final Color color;

  MyButton({
    @required this.size,
    @required this.text,
    @required this.color,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );

    if (icon != null) {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(icon, color: Colors.white),
          ),
        ],
      );
    }

    return Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * size),
        alignment: Alignment.center,
        child: widget,
    );
  }
}