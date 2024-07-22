import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';
import 'package:mebelmutiara/app/modules/widget/wgSlider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final getBarang = Get.put(HomeController());
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
              'MebelMutiara',
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
          return const Center(child: CircularProgressIndicator()); // Tampilkan loading indicator
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text('Error: ${controller.errorMessage}')); // Tampilkan pesan kesalahan
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SliderView(banners: getBarang.bannerItems), // Menambahkan slider di body
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Barang Baru',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Lihat Semua");
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.builder untuk barang baru
              ListView.builder(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                itemCount: controller.barang.value.results?.length ?? 0, // Jumlah item
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = controller.barang.value.results?[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: item?.gambarimage != null
                        ? Image.network(
                            '$contentURL/${item!.gambarimage!}',
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          )
                        : Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey, // Placeholder jika gambar tidak ada
                            child: const Center(child: Text('No Image')),
                          ),
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Barang Terlaris',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Lihat Semua");
                      },
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.builder untuk barang terlaris (scroll horizontal)
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 150, // Atur tinggi kontainer sesuai kebutuhan
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Mengatur scroll ke arah horizontal
                  itemCount: controller.barang.value.results?.length ?? 0, // Jumlah item
                  itemBuilder: (context, index) {
                    var item = controller.barang.value.results?[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10), // Spasi antar item
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: item?.gambarimage != null
                                ? Image.network(
                                  '$contentURL/${item!.gambarimage!}',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.grey, // Placeholder jika gambar tidak ada
                                    child: const Center(child: Text('No Image')),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 8), // Spasi antara gambar dan teks
                          Text(
                            item?.nama ?? 'No Name',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}