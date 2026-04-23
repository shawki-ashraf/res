import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/features/first_screen_views/first_screen_view.dart';

void main() {
  runApp(const YumQuickApp());
}

class YumQuickApp extends StatelessWidget {
  const YumQuickApp({super.key});

  @override
  Widget build(BuildContext context) {
    // أهم جزء هو الـ ScreenUtilInit
    return ScreenUtilInit(
      designSize: const Size(393, 852), // نفس مقاس التصميم بتاعك
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YumQuick',
          home: const FirstScreenView(), // شاشة البداية
        );
      },
    );
  }
}
