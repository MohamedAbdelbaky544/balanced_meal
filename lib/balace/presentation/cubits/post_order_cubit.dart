import 'package:balanced_meal/balace/domain/use_case/post_order_use_case.dart';
import 'package:balanced_meal/core/presentation/cubits/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balanced_meal/balace/domain/entities/order.dart' as d;
import 'package:injectable/injectable.dart';

@lazySingleton
class PostOrderCubit extends Cubit<BaseState<d.Order>> {
  PostOrderUseCase useCase;
  PostOrderCubit(this.useCase) : super(const BaseState());

  void postOrder({required d.Order order}) async {
    emit(state.setInProgressState());

    final result = await useCase.call(order);

    result.fold((failure) => emit(state.setFailureState(failure)),
        (r) => emit(state.setSuccessState(order)));
  }
}
