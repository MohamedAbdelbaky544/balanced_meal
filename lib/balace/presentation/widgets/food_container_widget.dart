import 'package:balanced_meal/balace/domain/entities/food_items.dart';
import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/extension/tr.dart';
import 'package:balanced_meal/core/presentation/widgets/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodContainerWidget extends StatelessWidget {
  const FoodContainerWidget({
    super.key,
    required this.foodItems,
  });

  final FoodItems foodItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 200,
      width: 183,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.appColor.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 4),
              spreadRadius: 0,
              blurRadius: 15.5,
              color: context.appColor.shadowColor,
            ),
          ]),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
              height: 108,
              width: 183,
              placeholder: (context, url) => const Loader(),
              imageUrl: foodItems.imageUrl,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const SizedBox(
                    height: 108,
                    width: 183,
                    child: Icon(Icons.add_shopping_cart_rounded),
                  )),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Tooltip(
                        message: foodItems.foodName,
                        child: Text(
                          foodItems.foodName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: context.appColor.textColor,
                          ),
                        ),
                      ),
                    ),
                    Tooltip(
                      message:
                          '${foodItems.calories} ${context.translation.cal}',
                      child: Text(
                        '${foodItems.calories} ${context.translation.cal}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.appColor.textColor.grey,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Tooltip(
                        message: '12 \$',
                        child: Text(
                          '12 \$',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: context.appColor.textColor,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text(context.translation.add))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
