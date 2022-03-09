import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/models/recipe.dart';

class MealAPI {
  static const String base_url =
      "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  static Future<List<Recipe>> searchRecipe(String term) async {
    final response = await http.get(Uri.parse(base_url + term));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final meals = (parsed["meals"] ?? []) as List<dynamic>;
      return meals.map((meal) => Recipe.fromApi(meal)).toList();
    } else {
      throw Exception("Http problem");
    }
  }
}
