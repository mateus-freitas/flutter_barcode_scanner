import 'package:barcode_reader/core/constants.dart';
import 'package:barcode_reader/core/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.instance;

@injectableInit
void configureInjection(Env environment) =>
    $initGetIt(sl, environment: environment.name);
