import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';

@JsonSerializable()
class Ingredient {
  const Ingredient(this.name, this.quantity);

  final String name;
  final String quantity;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
