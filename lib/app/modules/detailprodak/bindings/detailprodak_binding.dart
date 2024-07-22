import 'package:get/get.dart';

import '../controllers/detailprodak_controller.dart';

class DetailprodakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailprodakController>(
      () => DetailprodakController(),
    );
  }
}
