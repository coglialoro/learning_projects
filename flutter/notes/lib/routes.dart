import 'package:flutter/material.dart';
import 'package:notes/edit_page.dart';
import 'package:notes/home.dart';

class RouteGenerator {
  static const String homePage = "/";
  static const String editPage = "/edit";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case editPage:
        final args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => EditPage(args),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}
