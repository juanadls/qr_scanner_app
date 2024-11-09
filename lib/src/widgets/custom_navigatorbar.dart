import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currentIndex = uiprovider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int index) {
        uiprovider.selectedMenuOpt = index;
      },
      elevation: 0,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Mapa",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: "Direcciones",
        )
      ],
    );
  }
}
