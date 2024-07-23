import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Model untuk representasi item dalam keranjang belanja
class ChartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  Future<String> fetchUserId() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('userId')?.toString() ?? 'Unknown'; // Konversi ke String
  return userId;
}

  int calculateTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(CartItem item) {
    cartItems.add(item);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }
}
class CartItem {
  final int id;
  final String name;
  final int price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}
