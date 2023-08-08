import 'package:anywhere_code_exercise/features/character_viewer/presentation/pages/viewer_home.dart';
import 'package:flutter/material.dart';

class AppRouter{final String productFound = 'productdound';

const AppRouter._();

static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case ViewerHome.id:
      return MaterialPageRoute(builder: (context) => const ViewerHome());
    case DetailedPage:
      return MaterialPageRoute(builder: (context) => const DetailedPage)
    default:
      throw Exception('Route not found!');
  }
}

static Route<dynamic> onUnknownRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (_) => ProductNotFoundPage(),
  );
}}