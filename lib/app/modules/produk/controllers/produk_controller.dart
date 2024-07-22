import 'package:get/get.dart';
import 'package:mebelmutiara/app/modules/commons/API/services.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';

class ProdukController extends GetxController {
  //TODO: Implement ProdukController
  final services _apiService = services(); // Inisialisasi ApiService
  var barang = GetBarang().obs; // Menyimpan data barang
  var isLoading = true.obs; // Menyimpan status loading
  var errorMessage = ''.obs; // Menyimpan pesan kesalahan jika ada


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchBarang();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Memuat data barang dari ApiService
  Future<void> fetchBarang() async {
    try {
      isLoading(true); // Set status loading menjadi true
      var fetchedBarang = await _apiService.fetchBarang();
      if (fetchedBarang != null) {
        barang.value = fetchedBarang;
      }
    } catch (e) {
      print('Error fetching barang: $e');
      errorMessage.value = e.toString();
    } finally {
      isLoading(false); // Set status loading menjadi false setelah selesai
    }
  }
}
