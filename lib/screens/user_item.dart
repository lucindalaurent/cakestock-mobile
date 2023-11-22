import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cakestock/models/item.dart';
import 'package:cakestock/screens/detail_item.dart';
import 'package:cakestock/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class UserItemPage extends StatefulWidget {
  const UserItemPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<UserItemPage> {
  Future<List<Item>> fetchItem(request) async {
    var data = await request
        .get('https://lucinda-laurent-tugas.pbp.cs.ui.ac.id/get-user-items/');
    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cake Item(s)'),
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(request),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data!.isEmpty) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ListTile(
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                          "Price: ${snapshot.data![index].fields.price}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "Description: ${snapshot.data![index].fields.description}")
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailItemPage(
                                              item: snapshot.data![index])),
                                    );
                                  },
                                )),
                          ));
                }
              }
            }));
  }
}
