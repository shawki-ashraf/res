import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';
import 'package:yumquick/core/widgets/custom_button.dart';
import 'package:yumquick/core/widgets/textfields.dart';
import 'package:yumquick/features/auth/pages/login_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      appBar: AppBar(
        title: const Text("Hello!"),
        centerTitle: true,
        backgroundColor: AppColors.yellowBase,
      ),

      body: Column(
        children: [
          SizedBox(height: 80.h),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 26.h),

                    // Full Name
                    const CustomEmailField(
                      isPassword: false,
                      hintText: "Enter your full name",
                      labelText: "Full Name",
                    ),

                    SizedBox(height: 10.h),

                    // Email
                    const CustomEmailField(
                      isPassword: false,
                      hintText: "Enter your email",
                      labelText: "Email",
                    ),

                    SizedBox(height: 10.h),

                    // Mobile Number
                    const CustomEmailField(
                      isPassword: false,
                      hintText: "Enter your mobile number",
                      labelText: "Mobile Number",
                    ),

                    SizedBox(height: 10.h),

                    // Password
                    const CustomEmailField(
                      isPassword: true,
                      hintText: "Enter your password",
                      labelText: "Password",
                    ),

                    SizedBox(height: 10.h),

                    // Confirm Password
                    const CustomEmailField(
                      isPassword: true,
                      hintText: "Confirm your password",
                      labelText: "Confirm Password",
                    ),

                    SizedBox(height: 34.h),

                    Center(
                      child: CustomButton(
                        width: 200.w,
                        height: 50.h,
                        text: "Sign Up",
                        onPressed: () {
                          // register logic هنا
                        },
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: Text(
                          "Already have an account? Log In",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
