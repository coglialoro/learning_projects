import 'package:flutter/material.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/routes/add_recipe_page.dart';
import 'package:recipes_app/routes/api_result_page.dart';
import 'package:recipes_app/routes/edit_recipe_page.dart';
import 'package:recipes_app/routes/home_page.dart';
import 'package:recipes_app/routes/recipe_details_page.dart';
import 'package:recipes_app/routes/search_recipe_page.dart';

class RouteGenerator {
  static const String homePage = "/";
  static const String addRecipePage = "/add";
  static const String recipeDetailsPage = "/details";
  static const String recipeEditPage = "/edit";
  static const String searchRecipePage = "/search";
  static const String apiResultPage = "/result";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case addRecipePage:
        return MaterialPageRoute(
          builder: (_) => const AddRecipePage(),
        );
      case recipeDetailsPage:
        final id = settings.arguments as String?;
        if (id == null) {
          throw FormatException("Bad call");
        } else {
          return MaterialPageRoute(
            builder: (_) => RecipeDetailsPage(id),
          );
        }
      case recipeEditPage:
        final id = settings.arguments as String?;
        if (id == null) {
          throw FormatException("Bad call");
        } else {
          return MaterialPageRoute(
            builder: (_) => EditRecipePage(id),
          );
        }
      case searchRecipePage:
        return MaterialPageRoute(
          builder: (_) => const SearchRecipePage(),
        );
      case apiResultPage:
        final recipe = settings.arguments as Recipe?;
        if (recipe == null) {
          throw FormatException("Bad call");
        } else {
          return MaterialPageRoute(
            builder: (_) => APIResultPage(recipe),
          );
        }
      default:
        throw FormatException("Route not found");
    }
  }
}
