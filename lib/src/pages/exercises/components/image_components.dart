import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String image;

  ImageComponent({@required this.image});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Image(
        image: AssetImage('images/'+ image),
      ),
    );
  }
}
