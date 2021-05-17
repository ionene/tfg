import 'dart:convert';


import 'package:tfg_ione/src/models/exercise_model.dart';

UnitModel unitModelFromJson(String str) => UnitModel.fromJson(json.decode(str));

class UnitModel {
  UnitModel({
    this.id,
    this.title,
    this.percent,
    this.image,
    this.color,
    this.exercises,
  });

  int id;
  String title;
  double percent;
  String image;
  String color;
  List<ExerciseModel> exercises;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["id"],
        title: json["title"],
        percent: json["percent"],
        image: json["image"],
        color: json["color"],
        exercises: List<ExerciseModel>.from(json["exercises"].map((e) => ExerciseModel.fromJson(e)).toList()),
      );

}
