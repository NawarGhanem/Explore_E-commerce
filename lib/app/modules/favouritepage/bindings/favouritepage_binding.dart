import 'package:get/get.dart';

import '../controllers/favouritepage_controller.dart';

class FavouritepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouritepageController>(
      () => FavouritepageController(),
    );
  }
}
