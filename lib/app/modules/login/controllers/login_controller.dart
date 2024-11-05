import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_const.dart';
import '../../../../core/data/local_source/local_storage.dart';
import '../../../../core/data/remot_source/base_api_client.dart';
import '../../../../core/utils/dialogs/error_dialog.dart';
import '../../../../core/utils/dialogs/loading_dialog.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final count = 0.obs;
  void logIn() async {
    LoadingDialog().show();
    var response = await BaseApiClient.post<String>(
        url: ApiConst.login,
        formData: {
          "phone": email.text,
          "password": password.text,
        },
        converter: (e) {
          return (e['token']);
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
