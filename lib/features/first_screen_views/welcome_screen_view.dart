import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/widgets/custom_svg_wrapper.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/features/auth/pages/login_view.dart';
import 'package:yumquick/features/auth/pages/signin_view.dart'; // تأكدي من المسار

class WelcomeScreenView extends StatelessWidget {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orangeBase,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            const Spacer(flex: 2),
            // اللوجو
            CustomSvgWrapper(
              svgPath: AppAssets.logo2,
              height: 180.h,
              width: 200.w,
            ),
            SizedBox(height: 15.h),
            // اسم الأبليكيشن
            CustomSvgWrapper(
              svgPath: AppAssets.name,
              height: 45.h,
              width: 180.w,
              color: Colors.white, // لو حابه يظهر باللون الأبيض فوق البرتقالي
            ),
            SizedBox(height: 25.h),
            // وصف بسيط
            Text(
              "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                height: 1.5, // لزيادة المسافة بين السطور
              ),
            ),
            const Spacer(flex: 2),
            // زر تسجيل الدخول
            CustomButton(
              text: "Log In",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
                // هنا ضيفي كود الانتقال لصفحة الـ Login
                // CustomNavigator.goTo(context, LoginScreen());
              },
            ),
            SizedBox(height: 15.h),
            // زر إنشاء حساب
            CustomButton(
              text: "Sign Up",
              backgroundColor: const Color(0xFFFEE4A6), // لون فاتح متناسق
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SigninView()),
                );
                // هنا ضيفي كود الانتقال لصفحة الـ Sign Up
              },
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
