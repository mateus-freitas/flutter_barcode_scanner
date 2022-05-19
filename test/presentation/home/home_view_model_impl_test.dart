import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:barcode_reader/domain/barcode/scanned_code.dart';
import 'package:barcode_reader/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<ScannedCode> codes = [
    ScannedCode(
        type: CodeType.barcode,
        value: '1234567890',
        scannedAt: DateTime.now(),
        isUrl: false),
    ScannedCode(
        type: CodeType.barcode,
        value: '123456789012345',
        scannedAt: DateTime.now(),
        isUrl: false),
  ];
  late HomeViewModelImpl viewModel;

  setUp(() {
    viewModel = HomeViewModelImpl(codes: codes);
  });

  final testCode = ScannedCode(
      type: CodeType.qrCode,
      value: 'https://google.com',
      scannedAt: DateTime.now(),
      isUrl: true);

  test('should add a new code at the end of the scannedCodes list', () {
    // arrange
    final initialLength = viewModel.scannedCodes.length;

    // act
    viewModel.addNewCode(testCode);

    // assert
    expect(viewModel.scannedCodes.length, equals(initialLength + 1));
    expect(viewModel.scannedCodes.last, equals(testCode));
  });

  test('should remove the code at a specific index of the scannedCodes list',
      () {
    // arrange
    final initialLength = viewModel.scannedCodes.length;
    const removeAt = 1;
    final codeAtIndex = viewModel.scannedCodes[removeAt];

    // act
    final removed = viewModel.deleteCodeAt(removeAt);

    // assert
    expect(viewModel.scannedCodes.length, equals(initialLength - 1));
    expect(removed, equals(codeAtIndex));
  });
}
