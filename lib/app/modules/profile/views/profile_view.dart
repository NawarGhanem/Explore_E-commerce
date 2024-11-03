import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:project1/app/modules/home/views/home_view.dart';
import 'package:project1/app/widget/customfieldbutton.dart';

import '../../../widget/custom_input.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            const Spacer(
              flex: 2,
            ),
            Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset("assets/svg/Arrow.svg"))),
          ],
        ),
        title: Text(
          "Profile",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      width: 89,
                      height: 89,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                          child: Image.asset(
                        "assets/images/profile.png",
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 8,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.0, color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: SvgPicture.asset(
                          "assets/svg/edit.svg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Name",
                          style: TextStyle(fontSize: 13.sp),
                        )),
                    const SizedBox(height: 12.0),
                    CustomInput(
                      filled: true,
                      fillColor: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email Address",
                          style: TextStyle(fontSize: 13.sp),
                        )),
                    const SizedBox(height: 12.0),
                    CustomInput(
                      filled: true,
                      fillColor: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: 13.sp),
                        )),
                    const SizedBox(height: 12.0),
                    CustomInput(
                      obscureText: true,
                      filled: true,
                      fillColor: Color.fromRGBO(247, 247, 249, 1),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Recovery Password",
                          style: TextStyle(
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Customfilledbutton(text: "text", width: 290.w, ontap: null)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
