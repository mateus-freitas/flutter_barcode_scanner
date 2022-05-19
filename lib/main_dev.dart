import 'package:barcode_reader/core/constants.dart';
import 'package:barcode_reader/core/injection.dart';
import 'package:barcode_reader/presentation/app.dart';
import 'package:flutter/material.dart';

void main() {
  configureInjection(Env.dev);

  runApp(const MyApp());
}
