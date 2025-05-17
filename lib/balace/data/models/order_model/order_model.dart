import 'package:balanced_meal/balace/data/models/order_data_model/order_data_model.dart';
import 'package:balanced_meal/balace/domain/entities/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(createToJson: true)
class OrderModel {
  final List<OrderDataModel> items;

  OrderModel({required this.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

extension MapToDomain on OrderModel {
  Order toDomain() => Order(
        items: items.map((e) => e.toDomain()).toList(),
      );
}

extension MapFromDomain on Order {
  OrderModel fromDomain() => OrderModel(
        items: items.map((e) => e.fromDomain()).toList(),
      );
}
