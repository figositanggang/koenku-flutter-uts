import 'package:flutter/material.dart';

// models
import '../../models/tanaman_model.dart';

class Kopi extends StatelessWidget {
  Kopi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tanaman[2]["nama"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tanaman[2]["nama"],
              child: Image.network(tanaman[2]["url"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: tanaman[2]["budidaya"],
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
