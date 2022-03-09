import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/recipe_form.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez - Add"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RecipeForm(RecipeFormMode.Add),
      ),
    );
  }
}
