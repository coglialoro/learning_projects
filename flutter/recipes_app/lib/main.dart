import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/recipes.dart';
import 'package:recipes_app/routes.dart';
import 'package:recipes_app/themes/main.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Recipes(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
