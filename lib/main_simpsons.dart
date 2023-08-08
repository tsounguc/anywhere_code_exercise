import 'package:anywhere_code_exercise/main_common.dart';
import 'package:flutter/material.dart';

import 'config_flavors.dart';

void main() {
  final simpsonsConfig = FlavorConfig()
    ..appTitle = "The Simpsons Characters"
    ..baseUrl = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
    ..imageLocation = ""
    ..theme = ThemeData.light().copyWith(
      primaryColor: const Color(0xFFFFDE00),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFFFFDE00),
        background: const Color(0xFFFFDE00),
        secondary: const Color(0xFFFFFFFF),
        tertiary: const Color(0xFF654321),
      ),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            backgroundColor: Colors.black,
          ),
    );

  mainCommon(simpsonsConfig);
}
