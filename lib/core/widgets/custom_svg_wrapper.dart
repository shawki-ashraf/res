import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgWrapper extends StatelessWidget {
  const CustomSvgWrapper({
    super.key,
    required this.svgPath,
    this.height,
    this.width,
    this.fit = BoxFit.contain, // إضافة الـ fit بشكل افتراضي
    this.color, // إضافة إمكانية تغيير لون الـ SVG لو احتاجتي
  });

  final String svgPath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      height: height,
      width: width,
      fit: fit,
      // لو حبيتي تغيري لون الـ SVG برمجياً
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
