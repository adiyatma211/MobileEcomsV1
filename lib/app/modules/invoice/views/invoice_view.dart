import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  InvoiceView({Key? key}) : super(key: key);
  final controller = Get.put(InvoiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoiceView'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.invoiceItems.length,
            itemBuilder: (context, index) {
              var item = controller.invoiceItems[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quantity: ${item.quantity}'),
                      Text('Price per item: Rp ${item.price}'),
                      Text('Total: Rp ${item.price * item.quantity}'),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
