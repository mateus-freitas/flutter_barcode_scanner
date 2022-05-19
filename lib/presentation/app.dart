import 'package:barcode_reader/core/injection.dart';
import 'package:barcode_reader/presentation/home/home_page.dart';
import 'package:barcode_reader/presentation/home/home_page_controller.dart';
import 'package:barcode_reader/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        controller: sl<IHomePageController>(),
        viewModel: sl<IHomeViewModel>(),
      ),
    );
  }
}
