import 'package:flutter/material.dart';

import 'package:tfg_ione/src/widgets/myAppBar.dart';

import 'package:tfg_ione/src/pages/exercises/components/audio_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/image_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/text_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/word_components.dart';

import 'package:tfg_ione/src/models/exercise_model.dart';
import 'package:tfg_ione/src/models/unit_model.dart';

import 'components/title_components.dart';

class ExercisesPage extends StatefulWidget {
  ExercisesPage({Key key}) : super(key: key);

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  UnitModel unit;
  int actualExercise = 0;

  @override
  Widget build(BuildContext context) {
    unit = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: MyAppBar(
        title: unit.title,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    ExerciseModel exercise = unit.exercises[actualExercise];

    List<Widget> components = [];

    if (exercise.title != null) {
      TitleComponent comp = TitleComponent(
        title: exercise.title,
      );

      components.add(comp);
    }

    if (exercise.image != null) {
      ImageComponent comp = ImageComponent(
        image: exercise.image,
      );

      components.add(comp);
    }

    if (exercise.audio != null) {
      AudioComponent comp = AudioComponent(
        audio: exercise.audio,
      );

      components.add(comp);
    }

    if (exercise.text != null) {
      TextComponent comp = TextComponent(
        text: exercise.text,
      );

      components.add(comp);
    }

    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0),
            height: size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: components,
            ),
          ),
          Container(
              height: size.height * 0.4,
              child: WordsComponent(
                load: exercise.load,
                response: exercise.response,
                incrementExercise: incrementExercise,
              )),
        ],
      ),
    );
  }

  incrementExercise() {
    (actualExercise < unit.exercises.length - 1) 
      ? actualExercise++ 
      : Navigator.pop(context);

    setState(() {});
  }
}
