import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/balace/domain/repositories/order_repository.dart';
import 'package:balanced_meal/core/domain/entities/failure.dart';
import 'package:balanced_meal/core/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class GetVegetableUseCase extends UseCase<List<FoodItems>, NoParams> {
  final OrderRepository repository;

  GetVegetableUseCase({required this.repository});
  @override
  Future<Either<Failure, List<FoodItems>>> call(NoParams params) async {
    return await repository.getVegetable();
  }
}
