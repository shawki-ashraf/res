import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // بياخد العرض المتاح كله
      height: height ?? 60.h, // طول مناسب زي اللي في الصورة
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? AppColors.yellowBase, // لون افتراضي
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r), // حواف دائرية زي التصميم
          ),
          elevation: 0, // لو مش عاوزه ظل تحت الزرار
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                textColor ?? const Color(0xFF4E342E), // اللون البني الداكن للنص
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
