import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/recipes.dart';
import 'package:recipes_app/routes.dart';
import 'package:recipes_app/widgets/recipes_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes = context.watch<Recipes>().list;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(RouteGenerator.addRecipePage),
                  child: Text("Add new"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(RouteGenerator.searchRecipePage),
                  child: Text("Search"),
                ),
              ],
            ),
            Expanded(child: RecipesList(recipes, RecipeListOrigin.Memory)),
          ],
        ),
      ),
    );
  }
}
