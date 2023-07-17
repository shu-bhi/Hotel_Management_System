import 'package:flutter/material.dart';

import '/models/menudisplay.dart';

class MenuItem {
  final String itemName;
  final String photoUrl;

  MenuItem({
    required this.itemName,
    required this.photoUrl,
  });
}

class Menu extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
        itemName: "Idly (4) - ₹25",
        photoUrl:
            "https://th.bing.com/th/id/OIP.ia3E9RgSk5nV00Gy7woiPQHaFN?w=257&h=180&c=7&r=0&o=5&pid=1.7"),
    MenuItem(
      itemName: "Bajji (4) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.09jhPJ-0KKMJ6mecvF2V6QHaFz?w=232&h=182&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Vada (3) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.U-byr6AmPCFWq9q6Ay10VwHaE7?w=282&h=187&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Punugu (4) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.Ck5XnDHlFeOVZ_kLQMbtKQHaFX?w=266&h=193&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Poori (2) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.aoqN1KBbQNCM6UTVLGKfeAHaE8?w=297&h=198&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Upma - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.udQvv5A97Wzd8RJCWvOUOQHaEO?w=329&h=187&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Plain Dosa (1) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.HJ8BqveakK0cuM-Umsjt-QHaE7?w=272&h=181&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Aapalu (3) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.rPUXuRWhj02FQy5IMY7T8gHaE5?w=280&h=185&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Raagi Dosa (3) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.a8WM8tqOnOQKbnZA5K20oAHaEo?w=292&h=182&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Jonna Dosa (3) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIP.8RUgJ3EURx_Ilfkn_XkzQAHaE7?w=259&h=180&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "3 Millets Dosa (3) - ₹25",
      photoUrl:
          "https://th.bing.com/th/id/OIG.N4ebrseNTASmcBqsyYv_?w=173&h=173&c=6&pcl=1b1a19&r=0&o=5&pid=ImgGn",
    ),
    MenuItem(
      itemName: "Sambar-Idly (3) - ₹30",
      photoUrl:
          "https://th.bing.com/th/id/OIP.HEdepfX-L3jIwPkTuQNWOQHaE8?w=276&h=184&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Pesarattu (1) - ₹30",
      photoUrl:
          "https://th.bing.com/th/id/OIP.IHa6T3WHAqNH4ZY85OJtVAHaGM?w=242&h=203&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Onion Dosa (1) - ₹30",
      photoUrl:
          "https://th.bing.com/th/id/OIP.hpYer1QmdSlzvcuma1HCSQHaE_?w=254&h=180&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Minapattu Upma (1) - ₹35",
      photoUrl:
          "https://th.bing.com/th/id/OIP.6jATs1B1mFh7KTX4D532HwHaE5?w=272&h=180&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Pesarattu Upma (1) - ₹35",
      photoUrl:
          "https://th.bing.com/th/id/OIP.rmyw_e3zeY1FE8mi_w8wJAHaEK?w=331&h=186&c=7&r=0&o=5&pid=1.7",
    ),
    MenuItem(
      itemName: "Masala Dosa (1) - ₹35",
      photoUrl:
          "https://th.bing.com/th/id/OIP.XSCo5S6kP3o-7-jVqH4vGgHaE8?w=269&h=180&c=7&r=0&o=5&pid=1.7",
    ),
  ];

  Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF003628),
        title: const Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return MenuDisplay(
            itemName: menuItems[index].itemName,
            photoURL: menuItems[index].photoUrl,
          );
        },
      ),
    );
  }
}
