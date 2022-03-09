import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/recipe_form.dart';

class EditRecipePage extends StatelessWidget {
  const EditRecipePage(this._id, {Key? key}) : super(key: key);

  final String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipez - Edit"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RecipeForm(
          RecipeFormMode.Edit,
          id: _id,
        ),
      ),
    );
  }
}
