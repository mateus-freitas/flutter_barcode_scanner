import 'package:barcode_reader/domain/barcode/code_type.dart';

class ScannedCode {
  final CodeType type;
  final String value;
  final bool isUrl;
  final DateTime scannedAt;

  ScannedCode({
    required this.type,
    required this.value,
    required this.scannedAt,
    required this.isUrl,
  });
}
