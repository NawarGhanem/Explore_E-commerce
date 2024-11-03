import 'package:get/get.dart';

class ButtonController extends GetxController {
  // Reactive variable to store the selected index
  var selectedIndex = 10.obs; // Default to -1 (no button selected)

  // Function to update selected button index
  void selectButton(int index) {
    selectedIndex.value = index;
  }
}
