import 'package:barcode_reader/domain/barcode/scanned_code.dart';
import 'package:injectable/injectable.dart';

abstract class IHomeViewModel {
  List<ScannedCode> get scannedCodes;
  void addNewCode(ScannedCode code);
  void deleteCodeAt(int index);
}

@Injectable(as: IHomeViewModel)
class HomeViewModelImpl implements IHomeViewModel {
  List<ScannedCode> _scannedCodes;

  HomeViewModelImpl({List<ScannedCode>? codes}) : _scannedCodes = codes ?? [];

  @override
  List<ScannedCode> get scannedCodes => _scannedCodes;

  @override
  void addNewCode(ScannedCode code) {
    _scannedCodes.add(code);
  }

  @override
  ScannedCode deleteCodeAt(int index) {
    return _scannedCodes.removeAt(index);
  }
}
