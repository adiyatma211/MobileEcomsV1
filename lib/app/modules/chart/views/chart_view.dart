import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chart_controller.dart';
class ChartView extends GetView<ChartController> {
  ChartView({Key? key}) : super(key: key) {
    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;
    if (arguments != null && arguments is List) {
      for (var argument in arguments) {
        if (argument is Map<String, dynamic>) {
          controller.addItem(CartItem(
            id: argument['id'],
            name: argument['name'],
            price: argument['price'],
            quantity: argument['quantity'],
          ));
        } else {
          // Tangani kasus jika elemen bukan Map<String, dynamic>
          print('Invalid argument format');
        }
      }
    } else {
      // Tangani kasus jika arguments adalah null atau bukan List
      print('Arguments are null or not a list');
    }
  }

 Future<void> _handleOrderSubmission(String address, String? deliveryOption, String userId) async {
  final userIdFromPrefs = await controller.fetchUserId();
  
  // Print data yang diterima dari dialog
  print('User ID: $userIdFromPrefs');
  print('Alamat: $address');
  print('Pilihan Pengiriman: $deliveryOption');

  
  // Jika ingin mencetak ID item dan quantity juga
  for (var item in controller.cartItems) {
    print('ID Item: ${item.id}');
    print('Nama Item: ${item.name}');
    print('Jumlah Item: ${item.quantity}');
    print('Total Harga Item: Rp ${item.price * item.quantity}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman detail produk
            Get.back(); // Kembali ke halaman sebelumnya
          },
        ),
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
                onPressed: () async {
                  final userIdFromPrefs = await controller.fetchUserId(); // Ambil userId dari prefs
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return OrderDialog(
                        onSubmit: (address, deliveryOption, userId) {
                          _handleOrderSubmission(address, deliveryOption, userId);
                        },
                        userId: userIdFromPrefs, // Kirim userId ke dialog
                      );
                    },
                  );
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
class OrderDialog extends StatefulWidget {
  final Function(String address, String? deliveryOption, String userId) onSubmit;
  final String userId; // Tambahkan userId ke widget

  const OrderDialog({Key? key, required this.onSubmit, required this.userId}) : super(key: key);

  @override
  _OrderDialogState createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  String? _deliveryOption;
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi Pembelian'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _addressController,
            decoration: const InputDecoration(
              labelText: 'Alamat',
              hintText: 'Masukkan alamat pengiriman',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Pilih Pengiriman:'),
          RadioListTile<String>(
            title: const Text('Kirim'),
            value: 'kirim',
            groupValue: _deliveryOption,
            onChanged: (value) {
              setState(() {
                _deliveryOption = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Ambil di Tempat'),
            value: 'ambil',
            groupValue: _deliveryOption,
            onChanged: (value) {
              setState(() {
                _deliveryOption = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onSubmit(
              _addressController.text,
              _deliveryOption,
              widget.userId,
            );
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: const Text('Kirim'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: const Text('Batal'),
        ),
      ],
    );
  }
}