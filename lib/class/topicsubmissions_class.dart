import 'package:pruebaflutter/class/entrepreneur_class.dart';

class TopicSubmissionsClass {
  TopicSubmissionsClass({
    this.entrepreneur,
  });

  EntrepreneurClass? entrepreneur;

  factory TopicSubmissionsClass.fromJson(Map<String, dynamic> json) =>
      TopicSubmissionsClass(
        entrepreneur: json["entrepreneur"] == null
            ? null
            : EntrepreneurClass.fromJson(json["entrepreneur"]),
      );

  Map<String, dynamic> toJson() => {
        "entrepreneur": entrepreneur == null ? null : entrepreneur!.toJson(),
      };
}
