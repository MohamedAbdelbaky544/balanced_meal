import 'package:balanced_meal/core/presentation/themes/material_colors.dart';
import 'package:flutter/material.dart';

abstract class AppColorScheme {
  Brightness get brightness;

  MaterialTextColor get textColor;

  Color get primaryColor => const Color(0xffF25700);

  Color get orangeTintColor => const Color(0xffFFEDE3);

  Color get whiteColor => Colors.white;

  Color get shadowColor => const Color(0x8989893D).withOpacity(0.24);

  Color get blackColor => Colors.black;

  Color get lightBlackColor => const Color(0xff1E1E1E);

  Color get darkGreyColor => const Color(0xff474747);

  Color get greyLightColor => const Color(0xffDADADA);

  Color get grey => const Color(0xff959595);

  Color get greyColorForBorder => const Color(0xffEAECF0);

  Color get backgroundColor => const Color(0xffFBFBFB);

  Color get errorColor => Colors.red;

  Color get successColor => const Color(0xff2E7D32);
}

class AppLightColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialTextColor get textColor => const MaterialTextColor(
        0xff1E1E1E,
        <TextColor, Color>{
          TextColor.secondary: Color(0xff12496A),
          TextColor.white: Colors.white,
          TextColor.grey: Color(0xff959595),
          TextColor.darkGrey: Color(0xff474747),
          TextColor.lightGrey: Color(0xffDADADA),
          TextColor.black: Color(0xff000000)
        },
      );
}
