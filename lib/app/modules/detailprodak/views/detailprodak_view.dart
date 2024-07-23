import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';

import '../controllers/detailprodak_controller.dart';

class DetailprodakView extends GetView<DetailprodakController> {
  DetailprodakView({Key? key}) : super(key: key);
  final DetailprodakController controller = Get.put(DetailprodakController());

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
              'Detail Prodak',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                print("Uhuy");
              },
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        var item = controller.barang.value.results?.first; // Ambil item pertama untuk ditampilkan

        if (item == null) {
          return Center(child: Text('No data available')); // Menampilkan pesan jika tidak ada data
        }

        return Container(
          margin: const EdgeInsets.only(top: 20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: item.tipeDetails?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var tipe = item.tipeDetails?[index];

              return GestureDetector(
                onTap: () {
                  // Aksi saat item ditekan
                  if (tipe != null && item.id != null) {
                    Get.toNamed('/itemdetail', arguments: {'itemId': item.id, 'tipeDetailId': tipe.tipeId});
                  }
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
                          '$contentURL/${item.gambarimage ?? ''}',
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
                        '${tipe?.namaTipe ?? ''} - ${tipe?.ukuran ?? ''} - Stok: ${tipe?.stok ?? 0}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}