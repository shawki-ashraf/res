import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/textfields.dart';
import 'package:yumquick/features/auth/pages/signin_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase, // لون فاتح متناسق
      appBar: AppBar(
        title: Text("Hello!"),
        centerTitle: true,
        backgroundColor: AppColors.yellowBase, // لون فاتح متناسق
      ),

      body: Column(
        children: [
          SizedBox(height: 80.h),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              width: double.infinity,
              height: 800.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // لون داكن للنص
                    ),
                  ),

                  SizedBox(height: 36.h),

                  CustomEmailField(
                    isPassword: false,
                    hintText: "Enter your email",
                    labelText: "Email",
                  ),

                  SizedBox(height: 16.h),

                  CustomEmailField(
                    isPassword: true,
                    hintText: "Enter your password",
                    labelText: "Password",
                  ),

                  SizedBox(height: 34.h),

                  Center(
                    child: CustomButton(
                      width: 200.w,
                      height: 50.h,
                      text: "Log In",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SigninView(),
                          ),
                        );
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600], // لون رمادي للنص
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
