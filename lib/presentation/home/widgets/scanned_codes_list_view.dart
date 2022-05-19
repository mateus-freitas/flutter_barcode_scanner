import 'package:barcode_reader/domain/barcode/scanned_code.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannedCodesListView extends StatelessWidget {
  final List<ScannedCode> codes;
  final void Function(int) onDelete;

  const ScannedCodesListView(
      {Key? key, required this.codes, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (codes.isEmpty) {
      return const Center(
        child: Text('You haven\'t scanned any barcode yet.'),
      );
    }
    return ListView.builder(
      itemCount: codes.length,
      itemBuilder: (context, index) {
        final code = codes[index];
        return ListTile(
          title: _ListTileTitle(code: code.value, isUrl: code.isUrl),
          subtitle: Text(
            code.scannedAt.toString(),
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
              onPressed: () => onDelete(index),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        );
      },
    );
  }
}

class _ListTileTitle extends StatelessWidget {
  final String code;
  final bool isUrl;

  const _ListTileTitle({Key? key, required this.code, required this.isUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isUrl);
    if (isUrl) {
      return InkWell(
        onTap: () => launchUrl(Uri.parse(code)),
        child: Text(
          code,
          style: const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline),
        ),
      );
    }
    return Text(
      code,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
