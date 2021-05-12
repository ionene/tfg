import 'dart:convert';

import 'package:flutter/material.dart';
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
  int percent;
  String image;
  String color;
  List<ExercisesModel> exercises;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["id"],
        title: json["title"],
        percent: json["percent"],
        image: json["image"],
        color: json["color"],
        //exercises: List<ExercisesModel>.from(json["exercises"].map((e) => ExercisesModel.fromJson(e))),
      );

}
