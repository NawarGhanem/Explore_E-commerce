import 'package:get/get.dart';

import '../controllers/onboard3_controller.dart';

class Onboard3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Onboard3Controller>(
      () => Onboard3Controller(),
    );
  }
}
