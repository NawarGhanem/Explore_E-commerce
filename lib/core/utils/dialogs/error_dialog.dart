import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog(String error, {void Function()? callBack}) {
  Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: Row(
      children: [
        Icon(Icons.error_outline, color: Colors.redAccent),
        SizedBox(width: 10),
        Text(
          "Error",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    ),
    content: Text(
      "$error",
      style: TextStyle(fontSize: 16),
    ),
    actions: [
      Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
            if (callBack != null) {
              callBack();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  ));
}
