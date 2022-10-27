import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercadin/src/config/custom_colors.dart';
import 'package:mercadin/src/pages/auth/sign_in_screen.dart';
import 'package:mercadin/src/pages/commons_widgets/app_name_widget.dart';

import '../../pages_routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(PagesRoutes.signInRoute);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade700,
              CustomColors.customSwatchColor,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppNameWidget(
              mercadinTitleColor: Colors.white,
              textSize: 40,
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.limeAccent),
            )
          ],
        ),
      ),
    );
  }
}
