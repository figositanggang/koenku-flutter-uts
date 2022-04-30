import 'package:flutter/material.dart';

import '../../widgets.dart';

// models
import '../../models/tanaman_model.dart';
import '../../models/pupuk_model.dart';
import '../../models/keranjang_model.dart';

import '../beli.dart';

class Pupuk extends StatefulWidget {
  const Pupuk({Key? key}) : super(key: key);

  @override
  State<Pupuk> createState() => _PupukState();
}

class _PupukState extends State<Pupuk> {
  String? _dropDownValue = null;
  final List<DropdownMenuItem<String>> _dropDownItems = List.generate(
    tanaman.length,
    (i) {
      return DropdownMenuItem(
        child: Text(tanaman[i]["nama"]),
        value: tanaman[i]["nama"],
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _filterPupuk(),
          MyGridView(
            children: _dropDownValue == "Sawit"
                ? List.generate(5, (i) {
                    return _buildPupuk(i);
                  })
                : _dropDownValue == "Karet"
                    ? List.generate(5, (i) {
                        return _buildPupuk(i + 5);
                      })
                    : _dropDownValue == "Kopi"
                        ? List.generate(5, (i) {
                            return _buildPupuk(i + 10);
                          })
                        : _dropDownValue == "Kakao"
                            ? List.generate(5, (i) {
                                return _buildPupuk(i + 15);
                              })
                            : _dropDownValue == "Teh"
                                ? List.generate(5, (i) {
                                    return _buildPupuk(i + 20);
                                  })
                                : List.generate(
                                    pupuk.length,
                                    (i) {
                                      return _buildPupuk(i);
                                    },
                                  ),
          ),
        ],
      ),
    );
  }

  Widget _filterPupuk() {
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
        hint: Text("Pilih Tanaman"),
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

  Widget _buildPupuk(i) {
    return MyGVContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            pupuk[i]["url"],
            fit: BoxFit.contain,
            width: 150,
          ),
          Text(
            pupuk[i]["nama"],
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(pupuk[i]["harga"]),
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
                        "nama": pupuk[i]["nama"],
                        "url": pupuk[i]["url"],
                        "harga": pupuk[i]["harga"],
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
                          builder: (context) => BeliSekarang(
                            image: pupuk[i]["url"],
                            nama: pupuk[i]["nama"],
                            harga: pupuk[i]["harga"],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
