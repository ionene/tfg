import 'dart:convert';

ExerciseModel exerciseModelFromJson(String str) =>
    ExerciseModel.fromJson(json.decode(str));

class ExerciseModel {
  ExerciseModel({
    this.order,
    this.title,
    this.image,
    this.audio,
    this.text,
    this.response,
    this.load,
  });

  int order;
  String title;
  dynamic image;
  dynamic audio;
  String text;
  List<String> response;
  List<String> load;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        order: json["order"],
        title: json["title"],
        image: json["image"],
        audio: json["audio"],
        text: json["text"],
        response: List<String>.from(json["response"].map((x) => x)).toList(),
        load: List<String>.from(json["load"].map((x) => x)).toList(),
      );
}
