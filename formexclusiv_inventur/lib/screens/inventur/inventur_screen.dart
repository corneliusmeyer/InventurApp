import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/screens/inventur/components/scanner_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class InventurScreen extends StatefulWidget {
  InventurScreen({Key key}) : super(key: key);

  @override
  _InventurScreenState createState() => _InventurScreenState();
}

class _InventurScreenState extends State<InventurScreen> {
  String barcode = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(barcode),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return ScannerView();
          },
        ).then((value) {
          setState(() {
            if (barcode.length > 0) barcode = value;
          });
        }),
      ),
    );
  }
}
