import 'package:get/get.dart';

import '../controllers/mainview_controller.dart';

class MainviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainviewController>(
      () => MainviewController(),
    );
  }
}
