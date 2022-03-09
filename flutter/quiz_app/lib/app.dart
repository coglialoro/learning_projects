import 'package:flutter/material.dart';
import 'package:quiz_app/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
