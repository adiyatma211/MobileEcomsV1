import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';
import '../controllers/produk_controller.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';

class ProdukView extends GetView<ProdukController> {
  ProdukView({Key? key}) : super(key: key);
  final ProdukController controller = Get.put(ProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Merek Barang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Get.toNamed('/chart');
              },
            ),
          ],
        ),
        centerTitle: false,
      ),
    body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.barang.value.results == null || controller.barang.value.results!.isEmpty) {
          return Center(child: Text('No items found.'));
        } else {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: controller.barang.value.results!.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.barang.value.results![index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed('/detailprodak', arguments: item);
                  },
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                           '$contentURL/${item!.gambarimage!}', // Asumsikan gambarimage adalah URL gambar
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error); // Menampilkan ikon error jika gagal memuat gambar
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.nama ?? '', // Asumsikan nama adalah nama produk
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}