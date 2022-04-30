import 'package:flutter/material.dart';
import 'package:uts/views/beli.dart';

import '../models/keranjang_model.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Keranjang")),
      body: keranjang.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: List.generate(
                  keranjang.length,
                  (i) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            keranjang[i]["url"].toString(),
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            keranjang[i]["nama"].toString(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                keranjang[i]["harga"].toString(),
                              ),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BeliSekarang(
                                            image:
                                                keranjang[i]["url"].toString(),
                                            nama:
                                                keranjang[i]["nama"].toString(),
                                            harga: keranjang[i]["harga"]
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text("Beli Sekarang"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        keranjang.removeAt(i);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          : Center(
              child: Text("Kosong"),
            ),
    );
  }
}
