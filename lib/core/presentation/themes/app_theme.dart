import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final AppColorScheme _appColorScheme;
  AppTheme(this._appColorScheme);
  AppColorScheme get appColorScheme => _appColorScheme;
  ThemeData getThemeData(
    BuildContext context,
  ) {
    return ThemeData(
      primaryColor: _appColorScheme.primaryColor,
      colorScheme: ColorScheme(
        brightness: _appColorScheme.brightness,
        primary: _appColorScheme.primaryColor,
        onPrimary: _appColorScheme.whiteColor,
        secondary: _appColorScheme.primaryColor,
        onSecondary: _appColorScheme.blackColor,
        error: _appColorScheme.errorColor,
        onError: _appColorScheme.errorColor,
        surface: _appColorScheme.backgroundColor,
        onSurface: _appColorScheme.darkGreyColor,
      ),
      scaffoldBackgroundColor: context.appColor.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
          overlayColor:
              WidgetStateProperty.all(_appColorScheme.blackColor.withAlpha(50)),
          foregroundColor: WidgetStateProperty.all(_appColorScheme.whiteColor),
          elevation: WidgetStateProperty.all(10),
          backgroundColor: WidgetStateProperty.all<Color>(
            _appColorScheme.primaryColor,
          ),
          shadowColor: WidgetStateProperty.all(context.appColor.shadowColor),
          minimumSize: WidgetStateProperty.all(const Size(32, 32)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          textStyle: WidgetStateProperty.all(TextStyle(
            color: _appColorScheme.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 5,
        backgroundColor: _appColorScheme.backgroundColor,
        foregroundColor: _appColorScheme.backgroundColor,
        shadowColor: _appColorScheme.shadowColor,
        surfaceTintColor: _appColorScheme.backgroundColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: context.appColor.whiteColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.appColor.errorColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.appColor.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.appColor.greyColorForBorder,
          ),
        ),
      ),
    );
  }
}

extension GetAppColorTheme on ThemeData {
  AppTheme appTheme([Brightness? brightness]) {
    late AppColorScheme appColorScheme;
    if ((brightness ?? this.brightness) == Brightness.light) {
      appColorScheme = AppLightColors();
    } else {
      /// Add dark theme here
    }
    return AppTheme(appColorScheme);
  }

  AppColorScheme get appColors {
    return appTheme().appColorScheme;
  }

  Color customColorMode({
    required Color inDarkMode,
    required Color inLightMode,
  }) =>
      brightness == Brightness.light ? inLightMode : inDarkMode;
}
