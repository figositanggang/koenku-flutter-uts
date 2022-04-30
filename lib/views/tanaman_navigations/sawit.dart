import 'package:flutter/material.dart';

// models
import '../../models/tanaman_model.dart';

class Sawit extends StatelessWidget {
  Sawit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tanaman[0]["nama"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tanaman[0]["nama"],
              child: Image.network(tanaman[0]["url"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: tanaman[0]["budidaya"],
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
