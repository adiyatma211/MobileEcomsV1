import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/services.dart';


class LoginController extends GetxController {
  final services _apiService = services(); // Inisialisasi ApiService
  var isPasswordVisible = false.obs; // Menyimpan visibilitas password
  var token = ''.obs; // Menyimpan token login

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Toggle visibility of the password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Perform login action
  Future<void> login(String email, String password) async {
    try {
      token.value = await _apiService.login(email, password);
      print('Login successful with token: ${token.value}');
      Get.toNamed('/mainview'); // Navigate to the main view
    } catch (e) {
      print('Login failed: $e');
      Get.snackbar(
        'Login Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      ); // Show error message
    }
  }
}