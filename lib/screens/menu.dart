import 'package:flutter/material.dart';
import 'package:cakestock/widgets/left_drawer.dart';
import 'package:cakestock/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<CakeItem> items = [
    CakeItem("Lihat Item", Icons.checklist),
    CakeItem("Tambah Item", Icons.add_shopping_cart),
    CakeItem("Logout", Icons.logout),
  ];
  // Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'CakeStock',
          ),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Cake Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  CakeItem item = entry.value;
                  // Iterasi untuk setiap item
                  return ShopCard(item, index);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CakeItem {
  final String name;
  final IconData icon;

  CakeItem(this.name, this.icon);
}
