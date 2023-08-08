import 'package:anywhere_code_exercise/main_common.dart';
import 'package:flutter/material.dart';

import 'config_flavors.dart';

void main() {
  final simpsonsConfig = FlavorConfig()
    ..appTitle = "The Simpsons Characters"
    ..baseUrl = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
    ..imageLocation = ""
    ..theme = ThemeData.light().copyWith(
      primaryColor: const Color(0xFF123456),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            backgroundColor: const Color(0xFF654321),
          ),
    );

  mainCommon(simpsonsConfig);
}
