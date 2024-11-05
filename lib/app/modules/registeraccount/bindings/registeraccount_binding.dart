import 'package:get/get.dart';

import '../controllers/registeraccount_controller.dart';

class RegisteraccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisteraccountController>(
      () => RegisteraccountController(),
    );
  }
}
