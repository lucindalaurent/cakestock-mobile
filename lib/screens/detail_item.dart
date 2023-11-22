import 'package:flutter/material.dart';
import 'package:cakestock/models/item.dart';

class DetailItemPage extends StatefulWidget {
  final Item item;

  DetailItemPage({required this.item});

  @override
  _DetailItemPageState createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(widget.item.fields.name),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.item.fields.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Amount of stock: ${widget.item.fields.amount}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Price: ${widget.item.fields.price}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Description: ${widget.item.fields.description}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
