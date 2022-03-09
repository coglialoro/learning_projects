import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';

class APIResult extends StatelessWidget {
  const APIResult(this.recipe, {Key? key}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recipe.title,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(
              "Meal: ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            recipe.mealType != null
                ? Text(
                    EnumToString.convertToString(recipe.mealType),
                    style: TextStyle(fontSize: 18.0),
                  )
                : Text(
                    "N/A",
                    style: TextStyle(fontSize: 18.0),
                  ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(
              "Servings: ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            recipe.servings != null
                ? Text(
                    "${recipe.servings}",
                    style: TextStyle(fontSize: 18.0),
                  )
                : Text(
                    "N/A",
                    style: TextStyle(fontSize: 18.0),
                  ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(
              "Difficulty: ",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            recipe.difficulty != null
                ? Text(
                    EnumToString.convertToString(recipe.difficulty),
                    style: TextStyle(fontSize: 18.0),
                  )
                : Text(
                    "N/A",
                    style: TextStyle(fontSize: 18.0),
                  ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Instructions: ",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(recipe.instructions),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Ingredients: ",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        ...recipe.ingredients.map(
          (ingredient) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${ingredient.name} - ${ingredient.quantity}"),
          ),
        ),
        recipe.image != null && recipe.image != ""
            ? Image.network(recipe.image!)
            : Container(),
      ],
    );
  }
}
