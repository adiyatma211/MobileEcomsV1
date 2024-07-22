import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  ChartView({Key? key}) : super(key: key);
    final ChartController controller = Get.put(ChartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            var item = controller.cartItems[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('Harga per item: Rp ${item.price}'),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Jumlah: ${item.quantity}'),
                  Text('Total: Rp ${item.price * item.quantity}'),
                ],
              ),
              onTap: () {
                // Aksi saat item dihapus dari keranjang belanja
                controller.removeItem(index);
              },
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Total Belanja: Rp ${controller.calculateTotalPrice()}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol beli ditekan
                  print('Proses Pembelian');
                },
                child: const Text('Beli Sekarang'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}