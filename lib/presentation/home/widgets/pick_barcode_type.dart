import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:barcode_reader/presentation/core/constants.dart';
import 'package:flutter/material.dart';

class PickBarcodeTypeDialog extends StatelessWidget {
  const PickBarcodeTypeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Margin.pageHorizontal, vertical: Margin.insideSection),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [CodeType.barcode, CodeType.qrCode]
              .map((type) => Material(
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(
                        type.title,
                      ),
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.all(0),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () => Navigator.of(context).pop(type),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
