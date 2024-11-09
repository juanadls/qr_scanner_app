import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner_app/src/widgets/scan_buttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text("Historial"), actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
      ]),
      body: const Center(child: Text("Home Page")),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
