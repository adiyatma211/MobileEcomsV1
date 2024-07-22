import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/chart/views/chart_view.dart';
import 'package:mebelmutiara/app/modules/home/views/home_view.dart';
import 'package:mebelmutiara/app/modules/invoice/views/invoice_view.dart';
import 'package:mebelmutiara/app/modules/produk/views/produk_view.dart';
import 'package:mebelmutiara/app/modules/profile/views/profile_view.dart';
import '../controllers/mainview_controller.dart';

class MainView extends StatelessWidget {
  final MainviewController _controller = Get.put(MainviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Center(
        child: _controller.widgetOptions.elementAt(_controller.selectedIndex.value),
      )),
      bottomNavigationBar: Obx(() => NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _controller.selectedIndex.value,
        onDestinationSelected: (index) {
          _controller.changePage(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.paste_rounded),
            selectedIcon: Icon(Icons.content_paste_go_rounded
            ),
            label: 'Prodak',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
           NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Invoice',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      )),
    );
  }
}