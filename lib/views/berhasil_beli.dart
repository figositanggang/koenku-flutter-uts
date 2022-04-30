import 'package:flutter/material.dart';

class BerhasilBeli extends StatelessWidget {
  const BerhasilBeli({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text("Pembelian Berhasil"),
      ),
    );
  }
}
