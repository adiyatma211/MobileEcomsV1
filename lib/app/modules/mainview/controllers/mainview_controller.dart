import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/chart/views/chart_view.dart';
import 'package:mebelmutiara/app/modules/home/views/home_view.dart';
import 'package:mebelmutiara/app/modules/invoice/views/invoice_view.dart';
import 'package:mebelmutiara/app/modules/produk/views/produk_view.dart';
import 'package:mebelmutiara/app/modules/profile/views/profile_view.dart';

class MainviewController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> widgetOptions  = [
    HomeView(),
    ProdukView(),
    ChartView(),
    InvoiceView(),
    ProfileView(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}