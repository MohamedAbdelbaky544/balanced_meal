import 'package:balanced_meal/balace/presentation/controller/card_controller.dart';
import 'package:balanced_meal/balace/presentation/widgets/carb_widget.dart';
import 'package:balanced_meal/balace/presentation/widgets/meat_widget.dart';
import 'package:balanced_meal/balace/presentation/widgets/vegetables_widget.dart';
import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/extension/tr.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  static const String path = '/OrderPage';

  const OrderPage({
    super.key,
    required this.calories,
  });

  final double calories;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final CardController cardController = CardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_left,
            color: context.appColor.lightBlackColor,
            size: 32,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.translation.createYourOrder,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: context.appColor.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            VegetablesWidget(
              cardController: cardController,
            ),
            const SizedBox(
              height: 24,
            ),
            MeatWidget(
              cardController: cardController,
            ),
            const SizedBox(
              height: 24,
            ),
            CarbsWidget(
              cardController: cardController,
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ListenableBuilder(
          listenable: cardController,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(24),
              height: 167,
              width: MediaQuery.sizeOf(context).width,
              color: context.appColor.backgroundColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.translation.cal,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.appColor.textColor,
                        ),
                      ),
                      Tooltip(
                        message:
                            '${widget.calories.toInt().toString()} ${context.translation.cal} ',
                        child: Text(
                          '${widget.calories.toInt().toString()} ${context.translation.cal} ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: context.appColor.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.translation.price,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: context.appColor.textColor,
                        ),
                      ),
                      Tooltip(
                        message: '${cardController.price} \$',
                        child: Text(
                          '${cardController.price} \$',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: context.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: context.theme.elevatedButtonTheme.style?.copyWith(
                        backgroundColor: WidgetStateProperty.all(
                            cardController.card.isNotEmpty
                                ? context.appColor.primaryColor
                                : context.appColor.greyColorForBorder),
                      ),
                      child: Text(
                        context.translation.placeOrder,
                        style: GoogleFonts.poppins(
                          color: cardController.card.isNotEmpty
                              ? context.appColor.textColor.white
                              : context.appColor.textColor.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
