import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/balace/domain/use_case/get_carbs_use_case.dart';
import 'package:balanced_meal/core/domain/use_cases/use_case.dart';
import 'package:balanced_meal/core/presentation/cubits/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class GetCarbsCubit extends Cubit<BaseState<List<FoodItems>>> {
  final GetCarbsUseCase useCase;
  GetCarbsCubit(this.useCase) : super(const BaseState());

  void getCarbsMethod() async {
    emit(state.setInProgressState());
    final result = await useCase.call(const NoParams());

    result.fold((failure) => emit(state.setFailureState(failure)),
        (carbs) => emit(state.setSuccessState(carbs)));
  }
}
