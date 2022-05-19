enum CodeType { qrCode, barcode }

extension CodeTypeStrings on CodeType {
  String get title {
    switch (this) {
      case CodeType.qrCode:
        return 'QR Code';
      case CodeType.barcode:
        return 'Barcode';
    }
  }
}
