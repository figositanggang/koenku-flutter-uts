import 'package:flutter/material.dart';

// models
import '../../models/tanaman_model.dart';

class Karet extends StatelessWidget {
  Karet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tanaman[1]["nama"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tanaman[1]["nama"],
              child: Image.network(tanaman[1]["url"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: tanaman[1]["budidaya"],
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
