import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('SplashscreenController initialized');
    // Menambahkan delay 2 detik sebelum navigasi ke route berikutnya
    Future.delayed(Duration(seconds: 2), () {
      print('Navigating to /login');
      // Navigasi ke route /home setelah delay
      Get.toNamed('/login');
    });
  }
}
