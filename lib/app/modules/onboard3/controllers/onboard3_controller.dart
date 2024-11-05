import 'package:get/get.dart';
import 'package:project1/app/modules/home/views/home_view.dart';

import '../../../../core/constants/local_storage_keys.dart';
import '../../../../core/data/local_source/local_storage.dart';

class Onboard3Controller extends GetxController {
  void next() async {
    LocalStorage localStorage = LocalStorage();
    localStorage.writeValue(LocalStorageKeys.onBoarding, true);
    Get.to(() => HomeView());
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
