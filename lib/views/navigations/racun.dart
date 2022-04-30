import 'package:flutter/material.dart';

import '../../widgets.dart';

// models
import '../../models/racun_model.dart';
import '../../models/keranjang_model.dart';

import '../beli.dart';

class Racun extends StatefulWidget {
  const Racun({Key? key}) : super(key: key);

  @override
  State<Racun> createState() => _RacunState();
}

class _RacunState extends State<Racun> {
  String? _dropDownValue = null;
  final List<DropdownMenuItem<String>> _dropDownItems = [
    DropdownMenuItem(
      child: Text("Tungau"),
      value: "Tungau",
    ),
    DropdownMenuItem(
      child: Text("Ulat Api"),
      value: "Ulat Api",
    ),
    DropdownMenuItem(
      child: Text("Tikus"),
      value: "Tikus",
    ),
    DropdownMenuItem(
      child: Text("Belalang"),
      value: "Belalang",
    ),
    DropdownMenuItem(
      child: Text("Siput"),
      value: "Siput",
    ),
    DropdownMenuItem(
      child: Text("Uret"),
      value: "Uret",
    ),
    DropdownMenuItem(
      child: Text("Rayap"),
      value: "Rayap",
    ),
    DropdownMenuItem(
      child: Text("Kumbang"),
      value: "Kumbang",
    ),
    DropdownMenuItem(
      child: Text("Wereng"),
      value: "Wereng",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _filterRacun(),
          Divider(),
          _buildRacun(_dropDownValue),
        ],
      ),
    );
  }

  Widget _filterRacun() {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          setState(() {
            _dropDownValue = null;
          });
        },
        icon: Icon(Icons.cleaning_services),
      ),
      title: Text("Filter"),
      trailing: DropdownButton(
        hint: Text("Pilih Hama"),
        value: _dropDownValue,
        items: _dropDownItems,
        onChanged: (val) {
          setState(() {
            _dropDownValue = val.toString();
          });
        },
      ),
    );
  }

  Widget _buildRacun(value) {
    List group = [];
    if (value != null) {
      group = racun.where((element) => element["hama"] == value).toList();
    } else {
      group = racun;
    }
    return MyGridView(
      children: List.generate(
        group.length,
        (i) {
          return MyGVContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  group[i]["url"],
                  fit: BoxFit.contain,
                  width: 150,
                ),
                Text(
                  group[i]["nama"],
                  overflow: TextOverflow.clip,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(group[i]["harga"]),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border),
                              padding: EdgeInsets.zero,
                              splashRadius: 1,
                            ),
                            Text("5.0"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        KeranjangButton(
                          onPressed: () {
                            keranjang.add({
                              "nama": group[i]["nama"],
                              "url": group[i]["url"],
                              "harga": group[i]["harga"],
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Berhasil ditambahkan"),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                        BeliButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => BeliSekarang(
                                      image: group[i]["url"],
                                      nama: group[i]["nama"],
                                      harga: group[i]["harga"],
                                    )),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
