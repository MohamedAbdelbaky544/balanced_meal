// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'food_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItemsModel _$FoodItemsModelFromJson(Map json) => FoodItemsModel(
      id: json['id'] as String,
      foodName: json['food_name'] as String,
      calories: (json['calories'] as num).toInt(),
      imageUrl: json['image_url'] as String,
    );
