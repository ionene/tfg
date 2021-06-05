import 'package:flutter/material.dart';
import 'package:tfg_ione/preferences/main_preferences.dart';

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
  int index;

  bool start = false;

  final _prefs = MainPreferences();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    unit = arguments['unit'];
    index = arguments['index'];

    if (!start) {
      int tempActualExercise = arguments['actualExercise'] ?? 0;

      if (tempActualExercise == 5) {
        actualExercise = 0;

        updateDonePercent(0);
      } else {
        actualExercise = tempActualExercise;
      }

      start = true;

      setState(() {});
    }

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
            padding: EdgeInsets.only(top: 20.0),
            height: size.height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: components,
            ),
          ),
          Container(
            height: size.height * 0.5,
            child: WordsComponent(
              load: exercise.load,
              response: exercise.response,
              incrementExercise: incrementExercise,
            ),
          ),
        ],
      ),
    );
  }

  void incrementExercise() {
    ++actualExercise;

    updateDonePercent(actualExercise);
    
    if (actualExercise == unit.exercises.length)
      Navigator.pop(context);
      
    setState(() {});
  }

  void updateDonePercent(int percent) {
     List<dynamic> donePercent = _prefs.donePercent;
      donePercent[index] = percent;
      _prefs.donePercent = donePercent;
  }
}
