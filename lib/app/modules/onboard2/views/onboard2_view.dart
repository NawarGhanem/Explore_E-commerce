import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/onboard3/views/onboard3_view.dart';

import '../../../widget/customfieldbutton.dart';
import '../controllers/onboard2_controller.dart';

class Onboard2View extends GetView<Onboard2Controller> {
  const Onboard2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Customfilledbutton(
            text: "Next",
            textcolor: Colors.black,
            ontap: () => Get.to(() => Onboard3View()),
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/special_image_onboard.png"),
                      Image.asset('assets/images/smile.png'),
                    ]),
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Let’s Start Journey",
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
                      "Smart, Gorgeous & Fashionable\n         Collection Explor Now",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/onboard2_image.png")),
            ],
          ),
        ));
  }
}
