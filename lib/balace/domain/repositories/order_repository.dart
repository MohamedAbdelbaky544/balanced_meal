import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:balanced_meal/balace/domain/entities/order.dart' as d;

abstract class OrderRepository {
  Future<Either<Failure, void>> makeOrder({
    required d.Order orderData,
  });

  Future<Either<Failure, List<FoodItems>>> getVegetable();
  Future<Either<Failure, List<FoodItems>>> getCarbs();
  Future<Either<Failure, List<FoodItems>>> getMeat();
}
