import 'package:barcode_reader/domain/barcode/code_type.dart';
import 'package:barcode_reader/presentation/core/constants.dart';
import 'package:barcode_reader/presentation/core/loading.dart';
import 'package:barcode_reader/presentation/home/home_page_controller.dart';
import 'package:barcode_reader/presentation/home/home_view_model.dart';
import 'package:barcode_reader/presentation/home/widgets/scan_floating_button.dart';
import 'package:barcode_reader/presentation/home/widgets/scanned_codes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final IHomePageController controller;
  final IHomeViewModel viewModel;

  const HomePage({Key? key, required this.controller, required this.viewModel})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onSuccessfulScan(String codeValue, CodeType type) async {
    showLoadingDialog(context);
    final uri = Uri.tryParse(codeValue);
    final scannedCode = widget.controller
        .createCode(codeValue, type, uri != null && await canLaunchUrl(uri));
    Navigator.of(context).pop(); // Remove loading

    setState(() {
      widget.viewModel.addNewCode(scannedCode);
    });
  }

  void _onFailedScan() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Nothing was scanned.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      floatingActionButton: ScanFloatingButton(
        onScanResult: (result, type) async {
          result.fold(
              (l) => _onFailedScan(), (r) => _onSuccessfulScan(r, type));
        },
      ),
      body: ScannedCodesListView(
        codes: widget.viewModel.scannedCodes,
        onDelete: (index) {
          setState(() {
            widget.viewModel.deleteCodeAt(index);
          });
        },
      ),
    );
  }
}
