import 'package:flutter/material.dart';
import '../models/menucarditem.dart';
import 'package:share_plus/share_plus.dart';

class MenuItem {
  final String itemName;
  final double price;
  int quantity;

  MenuItem({
    required this.itemName,
    required this.price,
    this.quantity = 0,
  });
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List<MenuItem> menuItems = [
    MenuItem(itemName: "Idly (4) - ₹25", price: 25),
    MenuItem(itemName: "Bajji (4) - ₹25", price: 25),
    MenuItem(itemName: "Vada (3) - ₹25", price: 25),
    MenuItem(itemName: "Punugu (4) - ₹25", price: 25),
    MenuItem(itemName: "Poori (2) - ₹25", price: 25),
    MenuItem(itemName: "Plain Dosa (1) - ₹25", price: 25),
    MenuItem(itemName: "Aapalu (3) - ₹25", price: 25),
    MenuItem(itemName: "Raagi Dosa (3) - ₹25", price: 25),
    MenuItem(itemName: "Jonna Dosa (3) - ₹25", price: 25),
    MenuItem(itemName: "3 Millets Dosa (3) - ₹25", price: 25),
    MenuItem(itemName: "Sambar-Idly (3) - ₹30", price: 30),
    MenuItem(itemName: "Pesarattu (1) - ₹30", price: 30),
    MenuItem(itemName: "Onion Dosa (1) - ₹30", price: 30),
    MenuItem(itemName: "Minapattu Upma (1) - ₹35", price: 35),
    MenuItem(itemName: "Pesarattu Upma (1) - ₹35", price: 35),
    MenuItem(itemName: "Masala Dosa (1) - ₹35", price: 35),
  ];

  void generateAndShareReceipt() async {
    final List<MenuItem> selectedItems =
        menuItems.where((item) => item.quantity > 0).toList();
    final double totalSum = selectedItems.fold(
        0, (sum, item) => sum + (item.quantity * item.price));

    String receipt = 'Hotel Sri Sai Krishna\nBill-Receipt\n\n';
    receipt += 'Item                     Quantity   Price\n';
    receipt += '-----------------------------------------\n';

    for (final item in selectedItems) {
      final double itemTotal = item.quantity * item.price;
      receipt +=
          '${item.itemName.padRight(24)}${item.quantity.toString().padRight(11)}'
          '₹${itemTotal.toStringAsFixed(2)}\n';
    }

    receipt += '-----------------------------------------\n';
    receipt +=
        'Total:                              \₹${totalSum.toStringAsFixed(2)}';
    Share.share(receipt); // Share the receipt via the share package
  }

  @override
  Widget build(BuildContext context) {
    double totalsum =
        menuItems.fold(0, (sum, item) => sum + (item.quantity * item.price));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF003628),
        title: const Text(
          "Hotel Sri Sai Krishna",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return menucardItem(
            itemName: menuItems[index].itemName,
            price: menuItems[index].price,
            onQuantityChanged: (int newQuantity) {
              setState(() {
                menuItems[index].quantity = newQuantity;
              });
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0XFFDEF5E5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Total: ₹$totalsum',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: generateAndShareReceipt,
              icon: const Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
