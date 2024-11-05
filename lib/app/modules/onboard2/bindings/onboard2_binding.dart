import 'package:get/get.dart';

import '../controllers/onboard2_controller.dart';

class Onboard2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Onboard2Controller>(
      () => Onboard2Controller(),
    );
  }
}
