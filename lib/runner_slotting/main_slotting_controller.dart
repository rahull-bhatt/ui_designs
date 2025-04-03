import 'package:get/get.dart';

class SlottingController extends GetxController {
  RxInt selectedIcon = 1.obs; // Observable variable



  void changeIndex(int index) {
    selectedIcon.value = index; //  Method for value update
  }
}
