import 'package:flutter/material.dart';
import 'package:notes/models/notes.dart';
import 'package:notes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Notes>(
      create: (_) => Notes(),
      child: MaterialApp(
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
