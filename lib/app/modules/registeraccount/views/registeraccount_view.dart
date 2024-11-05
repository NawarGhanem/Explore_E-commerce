import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/login/bindings/login_binding.dart';
import 'package:project1/app/modules/login/views/login_view.dart';

import '../../../widget/custom_input.dart';
import '../../../widget/customfieldbutton.dart';
import '../bindings/registeraccount_binding.dart';
import '../controllers/registeraccount_controller.dart';

class RegisteraccountView extends GetView<RegisteraccountController> {
  const RegisteraccountView({super.key});
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
            text: "Already Have Account?",
            style: TextStyle(
              color: Color.fromRGBO(106, 106, 106, 1),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            children: [
              TextSpan(
                text: "Log In",
                style: TextStyle(
                    fontFamily: 'Droid',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.off(() => LoginView(), binding: LoginBinding());
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
              "Register Account",
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
            Text("Your Name"),
            CustomInput(
              controller: controller.username,
              hintText: "xxxxxxxxxxxx",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              fillColor: Color.fromRGBO(247, 247, 249, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text("EmailAddress"),
            CustomInput(
              controller: controller.email,
              hintText: "xyz@gmail.com",
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              fillColor: Color.fromRGBO(247, 247, 249, 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Password"),
            CustomInput(
              controller: controller.password,
              hintText: "*******",
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
                ontap: () => controller.signUp(),
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
