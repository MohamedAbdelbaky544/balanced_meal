import 'package:balanced_meal/balace/domain/entities/enum/gender.dart';
import 'package:balanced_meal/balace/presentation/pages/order_page.dart';
import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/extension/tr.dart';
import 'package:balanced_meal/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  static const String path = '/DetailsPage';

  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  GenderEnum? selectedGender;
  final TextEditingController widgetTextEditingController =
      TextEditingController();
  final TextEditingController heightTextEditingController =
      TextEditingController();
  final TextEditingController ageTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode weightFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();

  bool checkTextFieldsFilled() {
    if (selectedGender != null &&
        widgetTextEditingController.text != '' &&
        heightTextEditingController.text != '' &&
        ageTextEditingController.text != '') {
      setState(() {});
      return true;
    } else {
      setState(() {});

      return false;
    }
  }

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
          context.translation.enterYourDetails,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: context.appColor.textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 31,
              ),
              Text(
                context.translation.gender,
                style: GoogleFonts.poppins(
                  color: context.appColor.textColor.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField2<GenderEnum>(
                isExpanded: true,
                selectedItemBuilder: (BuildContext context) {
                  return GenderEnum.values.map<Widget>((GenderEnum gender) {
                    return Text(
                      context.translation.genderEnum(gender.name),
                      style: GoogleFonts.poppins(
                        color: context.appColor.textColor.darkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList();
                },
                hint: Text(
                  context.translation.chooseYourGender,
                  style: GoogleFonts.questrial(
                    color: context.appColor.textColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                items: [
                  ...GenderEnum.values.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: selectedGender == e
                          ? Container(
                              padding: const EdgeInsets.all(8),
                              color: context.appColor.orangeTintColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.translation.genderEnum(e.name),
                                  ),
                                  Icon(
                                    Icons.done,
                                    color: context.primaryColor,
                                  ),
                                ],
                              ),
                            )
                          : Text(context.translation.genderEnum(e.name)),
                    ),
                  ),
                ],
                value: selectedGender,
                onChanged: (gender) {
                  selectedGender = gender;
                  weightFocusNode.requestFocus();
                  setState(() {});
                },
                validator: (value) {
                  if (value == null) {
                    return context.translation.pleaseSelectAnOption;
                  }
                  return null;
                },
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: context.appColor.grey,
                  ),
                  iconEnabledColor: context.primaryColor,
                  iconDisabledColor: context.appColor.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: MediaQuery.sizeOf(context).width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.appColor.whiteColor,
                  ),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(8),
                    thickness: WidgetStateProperty.all<double>(6),
                    thumbVisibility: WidgetStateProperty.all<bool>(true),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.translation.weight,
                style: GoogleFonts.poppins(
                  color: context.appColor.textColor.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: widgetTextEditingController,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  heightFocusNode.requestFocus();
                },
                onChanged: (value) {
                  checkTextFieldsFilled();
                },
                textInputAction: TextInputAction.next,
                focusNode: weightFocusNode,
                validator: (value) {
                  if (value == null) {
                    return '${context.translation.please} ${context.translation.enterYourWeight}';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: context.translation.enterYourWeight,
                  hintStyle: GoogleFonts.questrial(
                    color: context.appColor.textColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Assets.icons.weightIcon.svg(
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.translation.height,
                style: GoogleFonts.poppins(
                  color: context.appColor.textColor.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: heightTextEditingController,
                focusNode: heightFocusNode,
                keyboardType: TextInputType.number,
                onFieldSubmitted: (value) {
                  ageFocusNode.requestFocus();
                },
                onChanged: (value) {
                  checkTextFieldsFilled();
                },
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null) {
                    return '${context.translation.please} ${context.translation.enterYourHeight}';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: context.translation.enterYourHeight,
                  hintStyle: GoogleFonts.questrial(
                    color: context.appColor.textColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Assets.icons.cm.svg(
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                context.translation.age,
                style: GoogleFonts.poppins(
                  color: context.appColor.textColor.darkGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageTextEditingController,
                focusNode: ageFocusNode,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  checkTextFieldsFilled();
                },
                onFieldSubmitted: (value) {
                  //TODO
                },
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null) {
                    return '${context.translation.please} ${context.translation.enterYourWeight}';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: context.translation.enterYourWeight,
                  hintStyle: GoogleFonts.questrial(
                    color: context.appColor.textColor.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 108,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              if (selectedGender != null &&
                  widgetTextEditingController.text != '' &&
                  heightTextEditingController.text != '' &&
                  ageTextEditingController.text != '') {
                if (_formKey.currentState!.validate()) {
                  double cals = calculateCalories(
                      gender: selectedGender!,
                      weight: double.parse(widgetTextEditingController.text),
                      height: double.parse(heightTextEditingController.text),
                      age: double.parse(ageTextEditingController.text));
                  context.pushNamed(OrderPage.path, queryParameters: {
                    'calories': cals.toString(),
                  });
                }
              }
            },
            style: context.theme.elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(
                  (selectedGender != null &&
                          widgetTextEditingController.text != '' &&
                          heightTextEditingController.text != '' &&
                          ageTextEditingController.text != '')
                      ? context.appColor.primaryColor
                      : context.appColor.greyColorForBorder),
            ),
            child: Text(
              context.translation.next,
              style: GoogleFonts.poppins(
                color: (selectedGender != null &&
                        widgetTextEditingController.text != '' &&
                        heightTextEditingController.text != '' &&
                        ageTextEditingController.text != '')
                    ? context.appColor.textColor.white
                    : context.appColor.textColor.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double calculateCalories({
    required GenderEnum gender,
    required double weight,
    required double height,
    required double age,
  }) {
    if (gender == GenderEnum.female) {
      return (655.1 + (9.56 * weight) + (1.85 * height) - (4.67 * age));
    } else {
      return (666.47 + (13.75 * weight) + (5 * height) - (6.75 * age));
    }
  }
}
