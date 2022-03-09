import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/routes.dart';

enum RecipeListOrigin {
  Memory,
  API,
}

class RecipesList extends StatelessWidget {
  const RecipesList(this.recipes, this.origin, {Key? key}) : super(key: key);

  final List<Recipe> recipes;
  final RecipeListOrigin origin;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(recipes[index].title),
        onTap: () {
          if (origin == RecipeListOrigin.Memory) {
            _memoryTapHandler(context, index);
          } else {
            _APITapHadler(context, index);
          }
        },
      ),
    );
  }

  void _memoryTapHandler(BuildContext context, int index) {
    Navigator.of(context).pushNamed(RouteGenerator.recipeDetailsPage,
        arguments: recipes[index].id);
  }

  void _APITapHadler(BuildContext context, int index) {
    Navigator.of(context)
        .pushNamed(RouteGenerator.apiResultPage, arguments: recipes[index]);
  }
}
