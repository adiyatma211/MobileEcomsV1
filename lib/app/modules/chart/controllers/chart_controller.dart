import 'package:get/get.dart';

// Model untuk representasi item dalam keranjang belanja
class CartItem {
  final String name;
  final int price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

// Controller untuk manajemen keranjang belanja
class ChartController extends GetxController {
  // List untuk menyimpan item-item dalam keranjang belanja
  final RxList cartItems = [].obs;

  // Fungsi untuk menambah item ke dalam keranjang belanja
  void addItem(CartItem item) {
    // Cek apakah item sudah ada dalam keranjang
    int index = cartItems.indexWhere((element) => element.name == item.name);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
  }

  // Fungsi untuk menghapus item dari keranjang belanja berdasarkan index
  void removeItem(int index) {
    cartItems.removeAt(index);
  }

  // Fungsi untuk menghitung total harga semua item dalam keranjang belanja
  int? calculateTotalPrice() {
    int? totalPrice = 0;
    for (var item in cartItems) {
      // totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }
}
