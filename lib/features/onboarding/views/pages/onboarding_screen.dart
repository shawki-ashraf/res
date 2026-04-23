import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/utils/app_assets.dart';
import 'package:yumquick/features/first_screen_views/welcome_screen_view.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/dot_indicator.dart';

/// 🔥 الصفحة اللي هتروح لها
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home Screen")));
  }
}

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<Map<String, String>> pages = [
    {
      "image": AppAssets.pizza,
      "title": "Order For Food",
      "description": "Choose your favorite meals easily.",
    },
    {
      "image": AppAssets.cake,
      "title": "Easy Payment",
      "description": "Pay quickly and securely.",
    },
    {
      "image": AppAssets.coffe,
      "title": "Fast Delivery",
      "description": "Get your order instantly.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            body: Stack(
              children: [
                /// 🔹 الصورة بس
                PageView.builder(
                  controller: cubit.pageController,
                  itemCount: pages.length,
                  onPageChanged: cubit.changePage,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      pages[index]["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                ),

                /// 🔹 الكونتينر اللي فوق الصورة
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// 🔸 العنوان
                        Text(
                          pages[cubit.currentIndex]["title"]!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// 🔸 الوصف
                        Text(
                          pages[cubit.currentIndex]["description"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        /// 🔸 dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (index) => DotIndicator(
                              isActive: cubit.currentIndex == index,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔸 الزرار (🔥 التعديل هنا)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (cubit.currentIndex == pages.length - 1) {
                                /// 🔥 Navigation
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreenView(),
                                  ),
                                );
                              } else {
                                cubit.nextPage();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              cubit.currentIndex == pages.length - 1
                                  ? "Get Started"
                                  : "Next",
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
        },
      ),
    );
  }
}
