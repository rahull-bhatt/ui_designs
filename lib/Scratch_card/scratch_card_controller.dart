import 'package:get/get.dart';

class ScratchCardController extends GetxController {
  RxDouble bottomSheetHeight = 100.0.obs;

  // Stores scratch state for each card based on tag
  RxMap<String, bool> scratchStates = <String, bool>{}.obs;

  void updateSheetHeight(double height) {
    bottomSheetHeight.value = height;
  }

  // Reveal reward for a specific card
  void revealReward(String tag) {
    scratchStates[tag] = true;
  }

  // Check if a specific card has been scratched
  bool isScratched(String tag) {
    return scratchStates[tag] ?? false;
  }

  // Reset a card to unscratched state
  void resetScratch(String tag) {
    scratchStates[tag] = false;
  }
}