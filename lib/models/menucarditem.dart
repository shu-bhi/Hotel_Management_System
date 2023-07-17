import 'package:flutter/material.dart';

class menucardItem extends StatefulWidget {
  final String itemName;
  final double price;
  final Function(int) onQuantityChanged;

  const menucardItem({
    required this.itemName,
    required this.price,
    required this.onQuantityChanged,
  });

  @override
  State<menucardItem> createState() => _menucardItemState();
}

class _menucardItemState extends State<menucardItem> {
  int quantity = 0;

  void increment() {
    setState(() {
      quantity++;
      widget.onQuantityChanged(quantity);
    });
  }

  void decrement() {
    setState(() {
      if (quantity <= 0) {
        quantity == 0;
      } else {
        quantity--;
        widget.onQuantityChanged(quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double amount = quantity * widget.price;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 8,
        shadowColor: Theme.of(context).colorScheme.inversePrimary,
        child: SizedBox(
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.itemName,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: decrement,
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              if (quantity >= 1)
                Text(
                  'Total: ₹${amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
