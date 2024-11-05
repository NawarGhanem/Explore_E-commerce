import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static final LoadingDialog _instance = LoadingDialog._internal();

  factory LoadingDialog() {
    return _instance;
  }

  LoadingDialog._internal();

  // Flag to indicate if the loading dialog is open
  bool isLoadingDialogOpen = false;

  void show({String? message}) {
    if (!isLoadingDialogOpen) {
      isLoadingDialogOpen = true;
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          content: Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.center,
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Lottie.asset('assets/lottie/loading.json',
                    //     width: 300.h, height: 300.h),
                    const Text('Loading...',
                        style: const TextStyle(color: Colors.black))
                  ],
                )),
          ),
        ),
        barrierDismissible: false,
      ).then((_) {
        // Ensure the flag is reset when the dialog is closed
        isLoadingDialogOpen = false;
      });
    }
  }

  void hide() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    if (isLoadingDialogOpen) {
      Navigator.pop(Get.overlayContext!, true);
      isLoadingDialogOpen = false;
    }
  }
}
