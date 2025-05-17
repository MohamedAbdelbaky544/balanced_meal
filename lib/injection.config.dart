// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:balanced_meal/balace/data/data_source/remote/items_remote_data_source.dart'
    as _i368;
import 'package:balanced_meal/balace/data/data_source/remote/order_remote_data_source.dart'
    as _i178;
import 'package:balanced_meal/balace/data/repositories/order_repository_impl.dart'
    as _i490;
import 'package:balanced_meal/balace/domain/repositories/order_repository.dart'
    as _i257;
import 'package:balanced_meal/balace/domain/use_case/get_carbs_use_case.dart'
    as _i196;
import 'package:balanced_meal/balace/domain/use_case/get_meat_use_case.dart'
    as _i60;
import 'package:balanced_meal/balace/domain/use_case/get_vegetable_use_case.dart'
    as _i43;
import 'package:balanced_meal/balace/domain/use_case/post_order_use_case.dart'
    as _i789;
import 'package:balanced_meal/balace/presentation/cubits/get_carbs_cubit.dart'
    as _i1040;
import 'package:balanced_meal/balace/presentation/cubits/get_meat_cubit.dart'
    as _i775;
import 'package:balanced_meal/balace/presentation/cubits/get_vegetable_cubit.dart'
    as _i288;
import 'package:balanced_meal/balace/presentation/cubits/post_order_cubit.dart'
    as _i956;
import 'package:balanced_meal/core/data/utils/configuration.dart' as _i429;
import 'package:balanced_meal/core/presentation/utils/configuration.dart'
    as _i39;
import 'package:balanced_meal/injectable_module.dart' as _i757;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

const String _stage = 'stage';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.lazySingleton<_i39.Configuration>(
      () => _i429.StagingConfiguration(),
      registerFor: {_stage},
    );
    gh.lazySingleton<_i368.ItemsRemoteDataSource>(
        () => _i368.ItemsRemoteDataSourceImpl());
    gh.lazySingleton<_i178.OrderRemoteDataSource>(
        () => _i178.OrderRemoteDataSourceImpl(
              gh<_i361.Dio>(),
              gh<_i39.Configuration>(),
            ));
    gh.lazySingleton<_i39.Configuration>(
      () => _i429.ProdConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i257.OrderRepository>(() => _i490.OrderRepositoryImpl(
          gh<_i178.OrderRemoteDataSource>(),
          gh<_i368.ItemsRemoteDataSource>(),
          gh<_i974.Logger>(),
        ));
    gh.lazySingleton<_i196.GetCarbsUseCase>(
        () => _i196.GetCarbsUseCase(repository: gh<_i257.OrderRepository>()));
    gh.lazySingleton<_i60.GetMeatUseCase>(
        () => _i60.GetMeatUseCase(repository: gh<_i257.OrderRepository>()));
    gh.lazySingleton<_i43.GetVegetableUseCase>(() =>
        _i43.GetVegetableUseCase(repository: gh<_i257.OrderRepository>()));
    gh.lazySingleton<_i789.PostOrderUseCase>(
        () => _i789.PostOrderUseCase(repository: gh<_i257.OrderRepository>()));
    gh.factory<_i775.GetMeatCubit>(
        () => _i775.GetMeatCubit(gh<_i60.GetMeatUseCase>()));
    gh.lazySingleton<_i956.PostOrderCubit>(
        () => _i956.PostOrderCubit(gh<_i789.PostOrderUseCase>()));
    gh.factory<_i1040.GetCarbsCubit>(
        () => _i1040.GetCarbsCubit(gh<_i196.GetCarbsUseCase>()));
    gh.factory<_i288.GetVegetableCubit>(
        () => _i288.GetVegetableCubit(gh<_i43.GetVegetableUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i757.InjectableModule {}
