import 'package:balanced_meal/balace/domain/entities/order_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_data_model.g.dart';

@JsonSerializable(createToJson: true)
class OrderDataModel {
  final String name;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  final int quantity;

  OrderDataModel({
    required this.name,
    required this.totalPrice,
    required this.quantity,
  });
  factory OrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataModelToJson(this);
}

extension MapToDomain on OrderDataModel {
  OrderData toDomain() => OrderData(
        name: name,
        totalPrice: totalPrice,
        quantity: quantity,
      );
}

extension MapFromDomain on OrderData {
  OrderDataModel fromDomain() => OrderDataModel(
        name: name,
        totalPrice: totalPrice,
        quantity: quantity,
      );
}
