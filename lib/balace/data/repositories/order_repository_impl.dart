import 'dart:developer';

import 'package:balanced_meal/balace/data/data_source/remote/items_remote_data_source.dart';
import 'package:balanced_meal/balace/data/data_source/remote/order_remote_data_source.dart';
import 'package:balanced_meal/balace/data/models/food_items_model/food_items_model.dart';
import 'package:balanced_meal/balace/data/models/order_model/order_model.dart';
import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/balace/domain/entities/order.dart' as d;
import 'package:balanced_meal/balace/domain/repositories/order_repository.dart';
import 'package:balanced_meal/core/data/repositories/base_repository_impl.dart';
import 'package:balanced_meal/core/domain/entities/enum/server_error_code.dart';
import 'package:balanced_meal/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl extends BaseRepositoryImpl
    implements OrderRepository {
  OrderRemoteDataSource remote;
  ItemsRemoteDataSource remoteFirebase;

  OrderRepositoryImpl(this.remote, this.remoteFirebase, super._logger);

  @override
  Future<Either<Failure, Unit>> makeOrder({required d.Order orderData}) async {
    return request(() async {
      await remote.postOrder(
        params: orderData.fromDomain(),
      );

      return right(unit);
    });
  }

  @override
  Future<Either<Failure, List<FoodItems>>> getCarbs() async {
    try {
      var result = await remoteFirebase.getCarbs();
      var temp = result.docs;

      var carbsModel = temp
          .map((e) => FoodItemsModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return Right(carbsModel.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  @override
  Future<Either<Failure, List<FoodItems>>> getMeat() async {
    try {
      var result = await remoteFirebase.getMeat();
      var temp = result.docs;

      var meatModel = temp
          .map((e) => FoodItemsModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      log('------------------------');
      log(meatModel.length.toString());
      log('------------------------');
      return Right(meatModel.map((e) => e.toDomain()).toList());
    } catch (e) {
      log('=======================');
      log(e.toString());
      log('=======================');
      return Left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  @override
  Future<Either<Failure, List<FoodItems>>> getVegetable() async {
    try {
      var result = await remoteFirebase.getVegetable();
      var temp = result.docs;

      var vegetableModel = temp
          .map((e) => FoodItemsModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return Right(vegetableModel.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }
}
