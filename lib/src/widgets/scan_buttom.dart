import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButtom extends StatelessWidget {
  const ScanButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        await FlutterBarcodeScanner.scanBarcode(
          "#3d8bef",
          "cancelar",
          false,
          ScanMode.QR,
        );
      },
    );
  }
}
