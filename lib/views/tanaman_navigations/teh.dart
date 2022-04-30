import 'package:flutter/material.dart';

// models
import '../../models/tanaman_model.dart';

class Teh extends StatelessWidget {
  Teh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tanaman[4]["nama"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tanaman[4]["nama"],
              child: Image.network(tanaman[4]["url"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: tanaman[4]["budidaya"],
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
