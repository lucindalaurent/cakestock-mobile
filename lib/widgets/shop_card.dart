import 'package:flutter/material.dart';
import 'package:cakestock/screens/menu.dart';
import 'package:cakestock/screens/addcake_form.dart';

class ShopCard extends StatelessWidget {
  final CakeItem item;
  final int index;
  static const colors = [
    Colors.blueAccent,
    Colors.lightGreen,
    Colors.redAccent
  ];
  const ShopCard(this.item, this.index, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors[index],
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            //navigasi ke MaterialPageRoute yang mencakup CakeFormPage.
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CakeFormPage(),
                ));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
