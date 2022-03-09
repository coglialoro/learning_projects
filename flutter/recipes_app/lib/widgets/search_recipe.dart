import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/utils/meal_api.dart';
import 'package:recipes_app/widgets/recipes_list.dart';

class SearchRecipe extends StatefulWidget {
  const SearchRecipe({Key? key}) : super(key: key);

  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  final searchController = TextEditingController();

  List<Recipe> recipes = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  MealAPI.searchRecipe(searchController.text).then((value) {
                    setState(() {
                      recipes = value;
                    });
                  });
                },
                child: Text("Search"),
              )
            ],
          ),
        ),
        Expanded(child: RecipesList(recipes, RecipeListOrigin.API)),
      ],
    );
  }
}
