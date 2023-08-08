import 'package:flutter/material.dart';

import 'config_flavors.dart';
import 'main_common.dart';

void main() {
  final wireConfig = FlavorConfig()
    ..appTitle = "The Wire Characters"
    ..apiEndpoint = {
      Endpoints.items: "http://api.duckduckgo.com/?q=the+wire+characters&format=json",
      Endpoints.details: ""
    }
    ..imageLocation = ""
    ..theme = ThemeData.light().copyWith(
      primaryColor: const Color(0xFF123456),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            backgroundColor: const Color(0xFF654321),
          ),
    );

  mainCommon(wireConfig);
}
