import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;

  TextComponent({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}