import 'package:barcode_reader/domain/barcode/scanned_code.dart';
import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IHomePageController {
  ScannedCode createCode(String value, CodeType type, bool isUrl);
}

@Injectable(as: IHomePageController)
class HomePageControllerImpl implements IHomePageController {
  @override
  ScannedCode createCode(String value, CodeType type, bool isUrl) {
    return ScannedCode(
        type: type,
        value: value,
        scannedAt: DateTime.now(),
        isUrl: type == CodeType.qrCode && isUrl);
  }
}
