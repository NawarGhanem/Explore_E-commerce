import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/data/local_source/local_storage.dart';
import '../../../../core/data/remot_source/base_api_client.dart';
import '../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../core/utils/dialogs/loading_dialog.dart';

class RegisteraccountController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signUp() async {
    LoadingDialog().show();
    var response = await BaseApiClient.post<String>(
        url: "http://task.focal-x.com/api/register",
        formData: {
          "name": username.text,
          "email": email.text,
          "password": password.text,
          "fcm_token": "xx1x",
        },
        converter: (e) {
          print(e['data']["access_token"]);
          return e['data']["access_token"];
        });
    LoadingDialog().hide();
    response.fold(
      (l) {
        showErrorDialog(l);
      },
      (r) {
        LocalStorage().setToken(r);
        Get.offNamed(
          '/home',
        );
      },
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
