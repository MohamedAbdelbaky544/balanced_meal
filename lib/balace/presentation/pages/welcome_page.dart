import 'package:balanced_meal/balace/presentation/pages/details_page.dart';
import 'package:balanced_meal/core/presentation/extension/theme.dart';
import 'package:balanced_meal/core/presentation/extension/tr.dart';
import 'package:balanced_meal/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static const String path = '/Welcome-Page';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Assets.images.wellcomeImge.image(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    context.appColor.blackColor.withOpacity(0),
                    context.appColor.blackColor,
                  ])),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.5), //48
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: Text(
                  context.translation.welcomeText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: context.appColor.greyLightColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -0.89),
              child: Text(
                context.translation.balancedMeal,
                style: GoogleFonts.abhayaLibre(
                  color: context.appColor.whiteColor,
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.75),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(
                        DetailsPage.path,
                      );
                    },
                    child: Text(
                      context.translation.orderFood,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
