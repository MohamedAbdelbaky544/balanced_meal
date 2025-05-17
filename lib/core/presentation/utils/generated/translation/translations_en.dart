import 'package:intl/intl.dart' as intl;

import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get retry => 'Retry';

  @override
  String get errorMessage => 'OOPS! Something went wrong';

  @override
  String get accessDeniedMessage => 'Access Denied, You have insufficient privileges';

  @override
  String get unauthenticatedMessage => 'Session is Expired!';

  @override
  String get connectionTimeOut => 'Connection Time Out!';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get balancedMeal => 'Balanced Meal';

  @override
  String get welcomeText => 'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.';

  @override
  String get enterYourDetails => 'Enter your details';

  @override
  String get gender => 'Gender';

  @override
  String get chooseYourGender => 'Choose Your Gender';

  @override
  String get weight => 'Weight';

  @override
  String get enterYourWeight => 'Enter your weight';

  @override
  String get height => 'Height';

  @override
  String get enterYourHeight => 'Enter your height';

  @override
  String get age => 'Age';

  @override
  String get enterYourAge => 'Enter your Age';

  @override
  String get orderFood => 'Order Food';

  @override
  String get createYourOrder => 'Create your order';

  @override
  String get vegetables => 'Vegetables';

  @override
  String get meats => 'Meats';

  @override
  String get carbs => 'Carbs';

  @override
  String get cal => 'Cal';

  @override
  String get placeOrder => 'Place order';

  @override
  String get price => 'Price';

  @override
  String get orderSummary => 'Order summary';

  @override
  String get confirm => 'Confirm';

  @override
  String genderEnum(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'male': 'Male',
        'female': 'Female',
        'other': 'None',
      },
    );
    return '$_temp0';
  }

  @override
  String get pleaseSelectAnOption => 'Please select an option';

  @override
  String get please => 'please';

  @override
  String get next => 'next';

  @override
  String get add => 'Add';

  @override
  String get thereIsNoData => 'There is no data';
}
