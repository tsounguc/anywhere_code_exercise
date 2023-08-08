import 'package:flutter/material.dart';

import 'config_flavors.dart';
import 'main_common.dart';

void main() {
  final wireConfig = FlavorConfig()
    ..appTitle = "The Wire Characters"
    ..baseUrl = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    ..imageLocation = ""
    ..theme = ThemeData.light().copyWith(
      primaryColor: Colors.blueGrey.shade700,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF000000),
          background: const Color(0xFFFFFFFF),
          secondary: const Color(0xFFFFFFFF),
          tertiary: const Color(0xFF000000)),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            backgroundColor: const Color(0xFF000000),
          ),
    );

  mainCommon(wireConfig);
}
