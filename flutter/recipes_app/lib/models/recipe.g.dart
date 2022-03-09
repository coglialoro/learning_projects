// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    id: json['id'] as String,
    title: json['title'] as String,
    mealType: _$enumDecodeNullable(_$MealTypeEnumMap, json['mealType']),
    servings: json['servings'] as int?,
    difficulty: _$enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']),
    instructions: json['instructions'] as String,
    ingredients: (json['ingredients'] as List<dynamic>)
        .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
        .toList(),
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mealType': _$MealTypeEnumMap[instance.mealType],
      'servings': instance.servings,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
      'instructions': instance.instructions,
      'image': instance.image,
      'ingredients': instance.ingredients,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$MealTypeEnumMap = {
  MealType.Breakfast: 'Breakfast',
  MealType.Lunch: 'Lunch',
  MealType.Supper: 'Supper',
  MealType.Snack: 'Snack',
};

const _$DifficultyEnumMap = {
  Difficulty.Beginner: 'Beginner',
  Difficulty.Intermediate: 'Intermediate',
  Difficulty.Advanced: 'Advanced',
};
