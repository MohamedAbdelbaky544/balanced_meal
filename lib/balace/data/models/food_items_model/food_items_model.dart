import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_items_model.g.dart';

@JsonSerializable()
class FoodItemsModel {
  final String id;
  @JsonKey(name: 'food_name')
  final String foodName;
  final int calories;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  FoodItemsModel({
    required this.id,
    required this.foodName,
    required this.calories,
    required this.imageUrl,
  });

  factory FoodItemsModel.fromJson(Map<String, dynamic> json) =>
      _$FoodItemsModelFromJson(json);
}

extension MapToDomain on FoodItemsModel {
  FoodItems toDomain() => FoodItems(
        id: id,
        foodName: foodName,
        calories: calories,
        imageUrl: imageUrl,
      );
}
