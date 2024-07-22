import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/services.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';
class ItemdetailController extends GetxController {
  final count = 1.obs; // Default count value
  final TextEditingController quantityController = TextEditingController();
  final services _apiService = services(); // API service instance
  var item = TipeDetails().obs; // Item details
  var isLoading = true.obs; // Loading status
  var errorMessage = ''.obs; // Error message

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  int calculateTotalPrice() {
    return count.value * 100000; // Price per item
  }

  int getTotalPrice() {
    return calculateTotalPrice();
  }

  @override
  void onClose() {
    quantityController.dispose();
    super.onClose();
  }

  Future<void> fetchItemDetails(int itemId) async {
    try {
      isLoading(true); // Set loading status to true
      var fetchedBarang = await _apiService.fetchBarang();
      if (fetchedBarang != null) {
        // Find the item with the matching ID
        var foundItem = fetchedBarang.results?.firstWhere(
          (result) => result.id == itemId,
          orElse: () => Results(), // Default if not found
        );
        if (foundItem != null) {
          // Get the first TipeDetails for the item
          item.value = foundItem.tipeDetails?.first ?? TipeDetails();
        }
      }
    } catch (e) {
      print('Error fetching item details: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading(false); // Set loading status to false
    }
  }
}
