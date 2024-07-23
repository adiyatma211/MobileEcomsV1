import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/chart/controllers/chart_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => ChartController());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
