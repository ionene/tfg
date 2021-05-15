import 'package:flutter/material.dart';

import 'package:tfg_ione/src/widgets/myAppBar.dart';

import 'package:tfg_ione/src/pages/exercises/components/audio_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/image_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/text_components.dart';
import 'package:tfg_ione/src/pages/exercises/components/word_components.dart';

import 'package:tfg_ione/src/models/exercise_model.dart';
import 'package:tfg_ione/src/models/unit_model.dart';

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

    if (exercise.image != null) {
      ImageComponent comp = ImageComponent(
        image: exercise.image,
      );

      components.add(comp);
    }

    if (exercise.text != null) {
      TextComponent comp = TextComponent(
        text: exercise.text,
      );

      components.add(comp);
    }
    // AudioComponent(),
    // WordComponent()

    return Container(
      child: Column(
        children: components,
      ),
    );
  }
}
