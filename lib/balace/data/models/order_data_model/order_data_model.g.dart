// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'order_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDataModel _$OrderDataModelFromJson(Map json) => OrderDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderDataModelToJson(OrderDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'total_price': instance.totalPrice,
      'quantity': instance.quantity,
    };
