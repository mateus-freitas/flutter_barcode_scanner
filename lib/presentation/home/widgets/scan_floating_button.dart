import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:barcode_reader/presentation/home/widgets/pick_barcode_type.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanFloatingButton extends StatelessWidget {
  final void Function(Either<String, String>, CodeType) onScanResult;
  const ScanFloatingButton({Key? key, required this.onScanResult})
      : super(key: key);

  ScanMode _codeTypeToScanMode(CodeType type) {
    switch (type) {
      case CodeType.qrCode:
        return ScanMode.QR;
      case CodeType.barcode:
        return ScanMode.BARCODE;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Scan Barcode',
        child: const Icon(Icons.qr_code),
        onPressed: () async {
          final choice = await showDialog<CodeType>(
              context: context,
              builder: (context) => const PickBarcodeTypeDialog());
          if (choice == null) {
            return;
          }
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#0245A3', 'Cancel', false, _codeTypeToScanMode(choice));
          if (barcodeScanRes.isEmpty || barcodeScanRes == '-1') {
            return onScanResult(
                const Left('There was an error scanning the barcode.'), choice);
          }
          return onScanResult(Right(barcodeScanRes), choice);
        });
  }
}
