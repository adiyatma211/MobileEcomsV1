import 'package:get/get.dart';

import '../controllers/itemdetail_controller.dart';

class ItemdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemdetailController>(
      () => ItemdetailController(),
    );
  }
}
