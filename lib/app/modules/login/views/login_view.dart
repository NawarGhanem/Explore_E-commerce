import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/home/bindings/home_binding.dart';
import 'package:project1/app/modules/home/views/home_view.dart';
import 'package:project1/app/modules/registeraccount/bindings/registeraccount_binding.dart';
import 'package:project1/app/modules/registeraccount/views/registeraccount_view.dart';
import 'package:project1/app/widget/custom_input.dart';
import 'package:project1/app/widget/customfieldbutton.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "New User?",
            style: TextStyle(
              color: Color.fromRGBO(106, 106, 106, 1),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            children: [
              TextSpan(
                text: "Create Account",
                style: TextStyle(
                    fontFamily: 'Droid',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.off(() => RegisteraccountView(),
                        binding: RegisteraccountBinding());
                  },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Container(
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: Color.fromRGBO(247, 247, 249, 1)),
                child: Icon(Icons.arrow_back_ios_sharp),
              ),
            ),
            Align(
                child: Text(
              "Hello Again!",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.sp),
            )),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Fill your details or continue with\n                  social media",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Color.fromRGBO(112, 123, 129, 1)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text("EmailAddress"),
            CustomInput(
              controller: controller.email,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              fillColor: Color.fromRGBO(247, 247, 249, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Password"),
            CustomInput(
              controller: controller.password,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              fillColor: Color.fromRGBO(247, 247, 249, 1),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Recovery Password",
                style: TextStyle(color: Color.fromRGBO(112, 123, 129, 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Customfilledbutton(
                text: "Sign In",
                ontap: () => controller.logIn(),
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Customfilledbutton(
              backgroundcolor: Color.fromRGBO(247, 247, 247, 1),
              bordercolor: Colors.transparent,
              text: "Sign In With Google",
              textcolor: Colors.black,
              ontap: null,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
