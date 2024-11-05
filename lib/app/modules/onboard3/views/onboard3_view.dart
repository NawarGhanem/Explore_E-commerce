import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/login/bindings/login_binding.dart';
import 'package:project1/app/modules/login/views/login_view.dart';

import '../../../widget/customfieldbutton.dart';
import '../controllers/onboard3_controller.dart';

class Onboard3View extends GetView<Onboard3Controller> {
  const Onboard3View({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Onboard3Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Customfilledbutton(
          text: "Next",
          textcolor: Colors.black,
          ontap: () {
            controller.next();
          },
          backgroundcolor: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.h, bottom: 30.h),
              child: Image.asset(
                'assets/images/smile.png',
                height: 77.h,
                width: 77.h,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "You Have the\n    Power To",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.h),
                  child: Text(
                    "There Are Many Beautiful And Attractive\n                    Plants To Your Room",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/onboard3_image.png"),
            ),
          ],
        ),
      ),
    );
  }
}
