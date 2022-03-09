import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/models/recipes.dart';
import 'package:recipes_app/routes.dart';
import 'package:recipes_app/widgets/api_result.dart';
import 'package:provider/provider.dart';

class APIResultPage extends StatelessWidget {
  const APIResultPage(this.recipe, {Key? key}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez - Detail"),
      ),
      body: Column(
        children: [
          Expanded(
            child: APIResult(recipe),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<Recipes>().addRecipe(recipe);
              Navigator.of(context).pushNamed(RouteGenerator.homePage);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
