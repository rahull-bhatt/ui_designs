import 'package:get/get.dart';

class SlotPageController extends GetxController {
  RxInt selectedTap = 1.obs;
  RxList<bool> breakFastBooked=[false, false].obs;
  RxBool isAnySlotSelected = false.obs;


  void changeBooked(bool value, int index) {
    breakFastBooked[index] = value;
    updateSelectionState(); // Update the selection state
  }

  void updateSelectionState() {
    isAnySlotSelected.value = breakFastBooked.contains(true);
  }

  void changeIndex(int index) {
    selectedTap.value = index; //  Method for value update
  }
}
