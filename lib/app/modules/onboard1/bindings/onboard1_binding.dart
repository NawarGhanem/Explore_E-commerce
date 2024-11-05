import 'package:get/get.dart';

import '../controllers/onboard1_controller.dart';

class Onboard1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Onboard1Controller>(
      () => Onboard1Controller(),
    );
  }
}
