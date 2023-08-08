// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

CharacterModel characterModelFromJson(String str) => CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  String firstUrl;
  CharacterIcon icon;
  String result;
  String text;

  CharacterModel({
    required this.firstUrl,
    required this.icon,
    required this.result,
    required this.text,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        firstUrl: json["FirstURL"],
        icon: CharacterIcon.fromJson(json["Icon"]),
        result: json["Result"],
        text: json["Text"],
      );

  Map<String, dynamic> toJson() => {
        "FirstURL": firstUrl,
        "Icon": icon.toJson(),
        "Result": result,
        "Text": text,
      };
}

class CharacterIcon {
  String height;
  String url;
  String width;

  CharacterIcon({
    required this.height,
    required this.url,
    required this.width,
  });

  factory CharacterIcon.fromJson(Map<String, dynamic> json) => CharacterIcon(
        height: json["Height"],
        url: json["URL"],
        width: json["Width"],
      );

  Map<String, dynamic> toJson() => {
        "Height": height,
        "URL": url,
        "Width": width,
      };
}
