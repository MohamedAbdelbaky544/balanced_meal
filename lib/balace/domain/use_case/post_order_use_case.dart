import 'package:balanced_meal/balace/domain/repositories/order_repository.dart';
import 'package:balanced_meal/core/domain/entities/failure.dart';
import 'package:balanced_meal/core/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:balanced_meal/balace/domain/entities/order.dart' as d;

@lazySingleton
class PostOrderUseCase extends UseCase<void, d.Order> {
  final OrderRepository repository;

  PostOrderUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(d.Order params) {
    return repository.makeOrder(orderData: params);
  }
}
