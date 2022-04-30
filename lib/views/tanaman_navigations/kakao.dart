import 'package:flutter/material.dart';

// models
import '../../models/tanaman_model.dart';

class Kakao extends StatelessWidget {
  Kakao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tanaman[3]["nama"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tanaman[3]["nama"],
              child: Image.network(tanaman[3]["url"]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                    text: tanaman[3]["budidaya"],
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
