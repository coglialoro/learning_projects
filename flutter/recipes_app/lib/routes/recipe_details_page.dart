import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipes.dart';
import 'package:recipes_app/routes.dart';
import 'package:recipes_app/widgets/recipe_details.dart';
import 'package:provider/provider.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage(this._id, {Key? key}) : super(key: key);

  final String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez - Detail"),
      ),
      body: Column(
        children: [
          Expanded(child: RecipeDetails(_id)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<Recipes>().removeRecipe(_id);
                  Navigator.of(context).pop();
                },
                child: Text("Delete"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.recipeEditPage, arguments: _id);
                },
                child: Text("Edit"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
