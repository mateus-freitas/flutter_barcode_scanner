import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:barcode_reader/presentation/home/home_page_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomePageControllerImpl controller;

  setUp(() {
    controller = HomePageControllerImpl();
  });

  test('should create an url code when it\'s an url', () {
    // arrange
    const value = 'https://google.com';

    // act
    final code = controller.createCode(value, CodeType.qrCode, true);

    // assert
    expect(code.isUrl, equals(true));
  });

  test(
      'shouldn\'t create an url code when the type isnt QR Code (only QR Codes should hold URLs)',
      () {
    // arrange
    const value = 'https://google.com';

    // act
    final code = controller.createCode(value, CodeType.barcode, true);

    // assert
    expect(code.isUrl, equals(false));
  });

  test('shouldn\'t create an url code when the value isnt an URL', () {
    // arrange
    const value = 'https1235664454';

    // act
    final code = controller.createCode(value, CodeType.qrCode, false);

    // assert
    expect(code.isUrl, equals(false));
  });
}
