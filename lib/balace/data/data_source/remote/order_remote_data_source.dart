import 'package:balanced_meal/balace/data/models/base_response_model/base_response_model.dart';
import 'package:balanced_meal/balace/data/models/order_model/order_model.dart';
import 'package:balanced_meal/core/presentation/utils/configuration.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'order_remote_data_source.g.dart';

abstract class OrderRemoteDataSource {
  Future<BaseResponseModel> postOrder({
    required OrderModel params,
  });
}

@LazySingleton(as: OrderRemoteDataSource)
@RestApi(baseUrl: '')
abstract class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @factoryMethod
  factory OrderRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _OrderRemoteDataSourceImpl(dio, baseUrl: configuration.getBaseUrl);
  }

  @override
  @POST('placeOrder')
  Future<BaseResponseModel> postOrder({
    @Body() required OrderModel params,
  });
}
