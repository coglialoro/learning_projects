import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/search_recipe.dart';

class SearchRecipePage extends StatelessWidget {
  const SearchRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez - Search"),
      ),
      body: const SearchRecipe(),
    );
  }
}
