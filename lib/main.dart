// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/screens/home_page.dart';
import 'package:qr_scanner_app/src/screens/mapa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: "home",
      routes: {
        "home": (BuildContext context) {
          return HomePage();
        },
        "mapa": (BuildContext context) {
          return MapaPage();
        },
      },
    );
  }
}
