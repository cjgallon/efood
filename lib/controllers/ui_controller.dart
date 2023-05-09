import 'package:get/get.dart';

class UIController extends GetxController {
  bool quickProductsModalShown = false;

  void closeQuickProductsModal() {
    quickProductsModalShown = true;
  }

  reset() {
    quickProductsModalShown = false;
  }
}
