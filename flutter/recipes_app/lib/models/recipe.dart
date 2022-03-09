import 'package:json_annotation/json_annotation.dart';
import 'package:recipes_app/models/ingredient.dart';

part 'recipe.g.dart';

enum MealType { Breakfast, Lunch, Supper, Snack }

enum Difficulty { Beginner, Intermediate, Advanced }

@JsonSerializable()
class Recipe {
  const Recipe(
      {required this.id,
      required this.title,
      this.mealType,
      this.servings,
      this.difficulty,
      required this.instructions,
      required this.ingredients,
      this.image});

  final String id;
  final String title;
  final MealType? mealType;
  final int? servings;
  final Difficulty? difficulty;
  final String instructions;
  final String? image;
  final List<Ingredient> ingredients;

  factory Recipe.fromApi(Map<String, dynamic> json) {
    final List<Ingredient> ingredients = [];

    for (int i = 1; i < 21; i++) {
      if (json["strIngredient$i"] != null && json["strIngredient$i"] != "") {
        ingredients
            .add(Ingredient(json["strIngredient$i"], json["strMeasure$i"]));
      }
    }

    return Recipe(
        id: json["idMeal"],
        title: json["strMeal"],
        instructions: json["strInstructions"],
        ingredients: ingredients,
        image: json["strMealThumb"]);
  }

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  String toString() {
    return "$id: $title";
  }
}
