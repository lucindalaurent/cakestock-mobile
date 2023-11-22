import 'package:flutter/material.dart';
import 'package:cakestock/screens/menu.dart';
import 'package:cakestock/screens/addcake_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:cakestock/screens/login.dart';
import 'package:cakestock/screens/list_item.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: colors[index],
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
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
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "https://lucinda-laurent-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          } else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
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
