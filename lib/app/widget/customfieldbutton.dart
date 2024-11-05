import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customfilledbutton extends StatelessWidget {
  final String text;
  final Function()? ontap;
  final double? width;
  final double? height;
  final double? borderwidth;
  final Color? backgroundcolor;
  final Color? textcolor;
  final Color? bordercolor;
  const Customfilledbutton(
      {super.key,
      required this.text,
      this.backgroundcolor,
      this.borderwidth,
      this.bordercolor,
      this.textcolor,
      required this.ontap,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: borderwidth ?? 0, color: bordercolor ?? Colors.green),
          color: backgroundcolor ?? Colors.green,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        height: height ?? 52.h,
        width: width ?? 152.w,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: textcolor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
