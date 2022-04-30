import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import './views/keranjang.dart';

// models
import './models/navigation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigationModels = models;

  int _index = 0;
  _changeCurrentIndex(val) {
    setState(() {
      _index = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_navigationModels[_index]["appbar"]["title"]),
      ),
      body: _navigationModels[_index]["screen"],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _index,
        onTap: (val) => _changeCurrentIndex(val),
        unselectedItemColor: Color.fromARGB(255, 31, 97, 58),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.compost),
            title: Text("Pupuk"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.pest_control),
            title: Text("Racun"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Keranjang())));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
