import 'package:flutter/material.dart';

enum Endpoints { items, details }

class FlavorConfig {
  String appTitle;
  // Map<Endpoints, String>? apiEndpoint;
  String? baseUrl;
  String imageLocation;
  ThemeData? theme;

  FlavorConfig({this.appTitle = "Anywhere Code exercise", this.imageLocation = ""}) {
    theme = ThemeData.light();
  }
}
