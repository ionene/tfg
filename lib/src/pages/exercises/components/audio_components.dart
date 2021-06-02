
import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class AudioComponent extends StatelessWidget {
  final String audio;

  final AudioCache audioCache = AudioCache();
  final AudioPlayer advancedPlayer = AudioPlayer();

  AudioComponent({@required this.audio});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.white10,
      margin: EdgeInsets.only(top: size.height * .1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => audioCache.play('audio/' + audio),
            child: Container(
              padding: EdgeInsets.all(15.0),
              
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                height: 60,
                image: AssetImage('assets/images/icon/audio.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
