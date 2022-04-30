import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts/views/beli.dart';

import '../../style.dart';

import '../../views/berhasil_beli.dart';

// models
import '../../models/tanaman_model.dart';

final myStyle = MyStyle();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _tanamanModel = tanaman;

  @override
  Widget build(BuildContext context) {
    final _primary = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: _primary,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Diskon 90%",
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeliSekarang(
                                image:
                                    "https://saraswantifertilizer.com/wp-content/uploads/2021/03/Front-Banner-Merk-palmo.png",
                                nama: "NPK Palmo",
                                harga: "Rp 10.000"),
                          ),
                        );
                      },
                      child: Text(
                        "Beli Sekarang",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Image.network(
                  "https://saraswantifertilizer.com/wp-content/uploads/2021/03/Front-Banner-Merk-palmo.png",
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.only(left: 16),
            child: myStyle.headline("Mulai Menanam"),
          ),

          // Konten Tanaman
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                _tanamanModel.length,
                (i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _tanamanModel[i]["screen"],
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Column(
                        children: [
                          _buildImage(i),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: myStyle.label(_tanamanModel[i]["nama"]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Hero(
        tag: _tanamanModel[i]["nama"],
        child: Image.network(
          _tanamanModel[i]["url"],
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgess) {
            if (loadingProgess == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgess.expectedTotalBytes != null
                    ? loadingProgess.cumulativeBytesLoaded /
                        loadingProgess.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
