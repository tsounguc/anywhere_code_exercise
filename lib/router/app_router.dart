import 'package:anywhere_code_exercise/viewer_home.dart';
import 'package:flutter/material.dart';

import '../features/character_viewer/presentation/pages/vertical_detail_page.dart';

class AppRouter {
  final String productFound = 'productdound';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case ViewerHome.id:
        return MaterialPageRoute(builder: (context) => const ViewerHome());
      case VerticalDetailPage.id:
        return MaterialPageRoute(settings: settings, builder: (context) => VerticalDetailPage());
      default:
        throw Exception('Route not found!');
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(
                  "Unknown Page",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ));
  }
}
