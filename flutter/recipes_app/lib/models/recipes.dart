import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:recipes_app/models/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Recipes extends ChangeNotifier {
  static const _key = "recipes";

  List<Recipe> list = [];

  Recipes() {
    _load().then((value) {
      list = value;
      notifyListeners();
    });
  }

  Future<List<Recipe>> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) {
      return [];
    } else {
      final parsedJson = List<dynamic>.from(jsonDecode(jsonStr));
      return parsedJson.map((e) => Recipe.fromJson(e)).toList();
    }
  }

  Future<void> _save(List<Recipe> recipes) async {
    list = recipes;
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(recipes);
    prefs.setString(_key, json);
  }

  void addRecipe(Recipe recipe) async {
    final recipes = await _load();
    recipes.add(recipe);
    await _save(recipes);
    notifyListeners();
  }

  void removeRecipe(String id) async {
    final recipes = await _load();
    recipes.removeWhere((element) => element.id == id);
    await _save(recipes);
    notifyListeners();
  }

  void editRecipe(String id, Recipe recipe) async {
    final recipes = await _load();
    final index = recipes.indexWhere((element) => element.id == id);
    recipes[index] = recipe;
    await _save(recipes);
    notifyListeners();
  }
}
