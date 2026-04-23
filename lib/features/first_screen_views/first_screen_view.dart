import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/helper/custom_navigator.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/widgets/custom_svg_wrapper.dart';
import 'package:yumquick/features/onboarding/views/pages/onboarding_screen.dart';

class FirstScreenView extends StatefulWidget {
  const FirstScreenView({super.key});

  @override
  State<FirstScreenView> createState() => _FirstScreenViewState();
}

class _FirstScreenViewState extends State<FirstScreenView> {
  @override
  void initState() {
    super.initState();
    // الانتقال لصفحة الترحيب بعد 3 ثوانٍ
    Future.delayed(
      const Duration(seconds: 3),
      () => CustomNavigator.goTo(
        context,
        OnboardingScreen(),
        type: NavigationType.pushReplacement,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: Center(
        // استخدام Center لضمان التوسيط الدقيق
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgWrapper(
              svgPath: AppAssets.logo1,
              height: 178.h,
              width: 202.w,
            ),
            SizedBox(height: 20.h),
            CustomSvgWrapper(
              svgPath: AppAssets.name,
              height: 52.h,
              width: 197.w,
            ),
          ],
        ),
      ),
    );
  }
}
