import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';
import '../controllers/itemdetail_controller.dart';
class ItemdetailView extends GetView<ItemdetailController> {
  ItemdetailView({Key? key}) : super(key: key);

  final controller = Get.put(ItemdetailController());
 @override
  Widget build(BuildContext context) {
    // Retrieve itemId from the arguments
    final int itemId = Get.arguments as int;

    // Call fetchItemDetails using itemId
    controller.fetchItemDetails(itemId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Barang', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/chart');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}'));
        }

        final item = controller.item.value;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Image.network(
              //     '$contentURL/${item.gambarimage ?? ''}', // Use image from item
              //     width: 200,
              //     height: 200,
              //     fit: BoxFit.cover,
              //     errorBuilder: (context, error, stackTrace) {
              //       return Icon(Icons.error); // Show error icon if image fails to load
              //     },
              //   ),
              // ),
              const SizedBox(height: 16),
              Text(
                item.namaTipe ?? '',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Rp ${controller.calculateTotalPrice()}',
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
              const SizedBox(height: 8),
              const Text(
                'Deskripsi barang akan ditulis di sini. Anda bisa menjelaskan detail tentang barang ini.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Jumlah: ', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          controller.decrement();
                        },
                      ),
                      Obx(() => Text(
                            '${controller.count}',
                            style: const TextStyle(fontSize: 18),
                          )),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          controller.increment();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total: ', style: TextStyle(fontSize: 18)),
                  Obx(() => Text(
                        'Rp ${controller.calculateTotalPrice()}',
                        style: const TextStyle(fontSize: 18, color: Colors.green),
                      )),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  int totalPrice = controller.getTotalPrice();
                  print('Total harga untuk ${controller.count} barang adalah Rp $totalPrice');
                  Get.toNamed('/detailprodak');
                },
                child: const Center(child: Text('Beli Sekarang')),
              ),
            ],
          ),
        );
      }),
    );
  }
}