import 'dart:convert';

ExercisesModel exercisesModelFromJson(String str) => ExercisesModel.fromJson(json.decode(str));

class ExercisesModel {
    ExercisesModel({
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

    factory ExercisesModel.fromJson(Map<String, dynamic> json) => ExercisesModel(
        order: json["order"],
        title: json["title"],
        image: json["image"],
        audio: json["audio"],
        text: json["text"],
        response: List<String>.from(json["response"].map((x) => x)),
        load: List<String>.from(json["load"].map((x) => x)),
    );
}