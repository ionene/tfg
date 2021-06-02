import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String image;

  ImageComponent({@required this.image});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Image(
        image: AssetImage('assets/images/'+ image),
      ),
    );
  }
}
