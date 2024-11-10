import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/db_provider.dart';
import 'package:qr_scanner_app/src/providers/ui_provider.dart';
import 'package:qr_scanner_app/src/screens/direcciones_page.dart';
import 'package:qr_scanner_app/src/screens/mapas_page.dart';
import 'package:qr_scanner_app/src/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner_app/src/widgets/scan_buttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text("Historial"), actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever,
            ))
      ]),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currentIndex = uiprovider.selectedMenuOpt;
    DBProvider.db.database;

    switch (currentIndex) {
      case 0:
        return const MapasPage();

      case 1:
        return const DireccionesPage();

      default:
        return const MapasPage();
    }
  }
}
