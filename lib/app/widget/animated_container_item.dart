import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/app/data/models/categories_model.dart';

class AnimatedContainerItem extends StatelessWidget {
  final CategoriesModel categories;
  final Color color;

  const AnimatedContainerItem({
    super.key,
    required this.categories,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        alignment: Alignment.center,
        height: 35.h,
        width: 220.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          " ${categories.name}",
          style: TextStyle(fontSize: 12.sp),
        ),
      ),
    );
  }
}
