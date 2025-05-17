import 'package:balanced_meal/balace/domain/entities/food_items.dart';

import 'package:balanced_meal/balace/domain/use_case/get_vegetable_use_case.dart';
import 'package:balanced_meal/core/domain/use_cases/use_case.dart';
import 'package:balanced_meal/core/presentation/cubits/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class GetVegetableCubit extends Cubit<BaseState<List<FoodItems>>> {
  final GetVegetableUseCase useCase;
  GetVegetableCubit(this.useCase) : super(const BaseState());

  void getVegetableMethod() async {
    emit(state.setInProgressState());
    final result = await useCase.call(const NoParams());

    result.fold((failure) => emit(state.setFailureState(failure)),
        (vegetable) => emit(state.setSuccessState(vegetable)));
  }
}
