import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/ingredient.dart';
import 'package:uuid/uuid.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/models/recipes.dart';

enum RecipeFormMode { Add, Edit }

class RecipeForm extends StatefulWidget {
  RecipeForm(this.mode, {Key? key, this.id}) : super(key: key);

  final RecipeFormMode mode;
  final String? id;

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final formKey = GlobalKey<FormState>();

  late final List<List<TextEditingController>> ingredientsControllers;
  late MealType mealType;
  late Difficulty difficulty;
  late final TextEditingController titleController;
  late final TextEditingController servingsController;
  late final TextEditingController instructionsController;
  late final TextEditingController imageController;

  @override
  void initState() {
    super.initState();

    if (widget.mode == RecipeFormMode.Edit) {
      final recipes = context.read<Recipes>().list;
      final recipe = recipes.firstWhere((element) => element.id == widget.id);
      if (recipe.mealType != null) {
        mealType = recipe.mealType!;
      } else {
        mealType = MealType.Breakfast;
      }

      if (recipe.difficulty != null) {
        difficulty = recipe.difficulty!;
      } else {
        difficulty = Difficulty.Beginner;
      }

      ingredientsControllers = recipe.ingredients
          .map((ingredient) => [
                TextEditingController(text: ingredient.name),
                TextEditingController(text: ingredient.quantity),
              ])
          .toList();

      titleController = TextEditingController(text: recipe.title);
      instructionsController = TextEditingController(text: recipe.instructions);
      servingsController = TextEditingController(
          text: recipe.servings != null ? "${recipe.servings}" : null);
      imageController = TextEditingController(text: recipe.image);
    } else {
      mealType = MealType.Breakfast;
      difficulty = Difficulty.Beginner;
      ingredientsControllers = [
        [
          TextEditingController(),
          TextEditingController(),
        ],
      ];

      titleController = TextEditingController();
      servingsController = TextEditingController();
      instructionsController = TextEditingController();
      imageController = TextEditingController();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    servingsController.dispose();
    instructionsController.dispose();
    imageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Recipe Title"),
              controller: titleController,
              validator: _notEmptyValidator,
            ),
            DropdownButton<MealType>(
              value: mealType,
              items: [
                MealType.Breakfast,
                MealType.Lunch,
                MealType.Snack,
                MealType.Supper,
              ]
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(EnumToString.convertToString(value)),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  mealType = newValue!;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Servings"),
              controller: servingsController,
              validator: _isNumberValidator,
              keyboardType: TextInputType.number,
            ),
            DropdownButton<Difficulty>(
              value: difficulty,
              items: [
                Difficulty.Beginner,
                Difficulty.Intermediate,
                Difficulty.Advanced
              ]
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(EnumToString.convertToString(value)),
                    ),
                  )
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  difficulty = newValue!;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Instructions"),
              controller: instructionsController,
              validator: _notEmptyValidator,
              maxLines: 5,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.headline6,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...ingredientsControllers
                    .map(
                      (controllers) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Name"),
                              controller: controllers[0],
                              validator: _notEmptyValidator,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(hintText: "Quantity"),
                              controller: controllers[1],
                              validator: _notEmptyValidator,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _removeIngredient(controllers),
                            icon: Icon(Icons.remove_circle),
                          )
                        ],
                      ),
                    )
                    .toList(),
                IconButton(
                  onPressed: _addIngredient,
                  icon: Icon(Icons.add_circle),
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Image url"),
              controller: imageController,
            ),
            ElevatedButton(
              onPressed: _save,
              child: Text(widget.mode == RecipeFormMode.Add ? "Add" : "Save"),
            ),
          ],
        ),
      ),
    );
  }

  String? _notEmptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  String? _isNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    try {
      int.parse(value);
      return null;
    } on FormatException {
      return 'Please insert a number';
    }
  }

  void _save() {
    if (formKey.currentState!.validate()) {
      final recipe = Recipe(
        id: widget.mode == RecipeFormMode.Add ? Uuid().v4() : widget.id!,
        title: titleController.text,
        mealType: mealType,
        servings: servingsController.text.isNotEmpty
            ? int.parse(servingsController.text)
            : null,
        difficulty: difficulty,
        instructions: instructionsController.text,
        ingredients: _generateIngredientsList(),
        image: imageController.text,
      );
      widget.mode == RecipeFormMode.Add
          ? context.read<Recipes>().addRecipe(recipe)
          : context.read<Recipes>().editRecipe(widget.id!, recipe);
      Navigator.of(context).pop();
    }
  }

  List<Ingredient> _generateIngredientsList() {
    return ingredientsControllers
        .map(
          (controllers) => Ingredient(
            controllers[0].text,
            controllers[1].text,
          ),
        )
        .toList();
  }

  void _addIngredient() {
    setState(() {
      ingredientsControllers.add(
        [
          TextEditingController(),
          TextEditingController(),
        ],
      );
    });
  }

  void _removeIngredient(List<TextEditingController> row) {
    setState(() {
      ingredientsControllers.remove(row);
    });
  }
}
