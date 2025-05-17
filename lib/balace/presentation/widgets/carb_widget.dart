import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/balace/presentation/cubits/get_carbs_cubit.dart';
import 'package:balanced_meal/balace/presentation/widgets/food_container_widget.dart';
import 'package:balanced_meal/core/presentation/cubits/base_state.dart';
import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/extension/tr.dart';
import 'package:balanced_meal/core/presentation/widgets/error_view.dart';
import 'package:balanced_meal/core/presentation/widgets/loader.dart';
import 'package:balanced_meal/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CarbsWidget extends StatefulWidget {
  const CarbsWidget({super.key});

  @override
  State<CarbsWidget> createState() => _CarbsWidgetState();
}

class _CarbsWidgetState extends State<CarbsWidget> {
  final GetCarbsCubit getCarbsCubit = getIt<GetCarbsCubit>();

  @override
  void initState() {
    getCarbsCubit.getCarbsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.translation.carbs,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: context.appColor.textColor,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 220,
          child: BlocBuilder<GetCarbsCubit, BaseState<List<FoodItems>>>(
            bloc: getCarbsCubit,
            builder: (context, state) {
              if (state.isInProgress) {
                return const Center(
                  child: Loader(),
                );
              } else if (state.isFailure) {
                return Center(
                  child: ErrorView(
                    onRetry: () {
                      getCarbsCubit.getCarbsMethod();
                    },
                  ),
                );
              } else {
                return state.item?.length != 0 ? ListView.builder(
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: state.item?.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return FoodContainerWidget(
                      foodItems: state.item![index],
                    );
                  },
                ) : Center(
                        child: Text(
                          context.translation.thereIsNoData,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: context.appColor.textColor,
                          ),
                        ),
                      );
              }
            },
          ),
        )
      ],
    );
  }
}
