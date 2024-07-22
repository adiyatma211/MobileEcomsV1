import 'package:get/get.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/chart/bindings/chart_binding.dart';
import '../modules/chart/views/chart_view.dart';
import '../modules/detailprodak/bindings/detailprodak_binding.dart';
import '../modules/detailprodak/views/detailprodak_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/invoice/bindings/invoice_binding.dart';
import '../modules/invoice/views/invoice_view.dart';
import '../modules/itemdetail/bindings/itemdetail_binding.dart';
import '../modules/itemdetail/views/itemdetail_view.dart';
import '../modules/mainview/bindings/mainview_binding.dart';
import '../modules/mainview/views/mainview_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splashscreen,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAINVIEW,
      page: () => MainView(),
      binding: MainviewBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () =>  ProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.CHART,
      page: () =>  ChartView(),
      binding: ChartBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPRODAK,
      page: () =>  DetailprodakView(),
      binding: DetailprodakBinding(),
    ),
    GetPage(
      name: _Paths.ITEMDETAIL,
      page: () =>  ItemdetailView(),
      binding: ItemdetailBinding(),
    ),
  ];
}
