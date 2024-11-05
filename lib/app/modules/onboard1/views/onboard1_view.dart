import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/home/views/home_view.dart';
import 'package:project1/app/modules/onboard2/views/onboard2_view.dart';
import 'package:project1/app/widget/customfieldbutton.dart';

import '../controllers/onboard1_controller.dart';

class Onboard1View extends GetView<Onboard1Controller> {
  const Onboard1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Customfilledbutton(
          text: "Get Started",
          textcolor: Colors.black,
          ontap: () => Get.to(Onboard2View()),
          backgroundcolor: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.h, bottom: 50.h),
              child: Image.asset(
                  'assets/images/special_image_header_on_board.png'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/images/smile.png'),
            ),
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "WELCOME TO\nBYTE BOUTIQUE",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Image.asset("assets/images/undertextimage.png"),
                ],
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: Image.asset("assets/images/onboard1_image.png")),
                Expanded(
                  flex: 1,
                  child: Image.asset("assets/images/special_image_onboard.png"),
                ),
              ],
            ),
            Image.asset("assets/images/special_image2_onboard.png"),
          ],
        ),
      ),
    );
  }
}
