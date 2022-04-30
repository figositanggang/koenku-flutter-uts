import 'package:flutter/material.dart';

// navigations
import '../views/navigations/home.dart';
import '../views/navigations/pupuk.dart';
import '../views/navigations/racun.dart';

List models = [
  {
    "appbar": {
      "title": "KoenKu",
      "leading": null,
    },
    "screen": Home(),
  },
  {
    "appbar": {
      "title": "Pupuk",
      "leading": null,
    },
    "screen": Pupuk(),
  },
  {
    "appbar": {
      "title": "Racun Hama",
      "leading": null,
    },
    "screen": Racun(),
  },
];
