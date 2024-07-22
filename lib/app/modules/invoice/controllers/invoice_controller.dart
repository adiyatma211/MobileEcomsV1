import 'package:get/get.dart';

class InvoiceItem {
  final String name;
  final int price;
  final int quantity;

  InvoiceItem({
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class InvoiceController extends GetxController {
  final List<InvoiceItem> invoiceItems = [
    InvoiceItem(name: 'Keyboard', price: 500000, quantity: 2),
    InvoiceItem(name: 'Mouse', price: 250000, quantity: 1),
    InvoiceItem(name: 'Monitor', price: 1500000, quantity: 1),
  ].obs;
}