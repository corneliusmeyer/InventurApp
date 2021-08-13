import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/inventur.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';
import 'package:formexclusiv_inventur/provider/excel_worker.dart';
import 'package:formexclusiv_inventur/screens/inventur/components/addItem_view.dart';
import 'package:formexclusiv_inventur/screens/inventur/components/scanner_view.dart';

class InventurScreen extends StatefulWidget {
  final Inventur inventur;
  InventurScreen({Key key, this.inventur}) : super(key: key);

  @override
  _InventurScreenState createState() => _InventurScreenState();
}

class _InventurScreenState extends State<InventurScreen> {
  ExcelWorker excel;
  List<DataRow> rows = [];
  @override
  void initState() {
    excel = new ExcelWorker(widget.inventur.inventur_file);
    widget.inventur.setup(excel);
  }

  String barcode = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [for (var item in widget.inventur.kategorien) Text(item)],
          ),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                label: Text('ID'),
              ),
              DataColumn(
                label: Text('Beschreibung'),
              ),
              DataColumn(
                label: Text('Bestand'),
              ),
              DataColumn(
                label: Text('Kategorie'),
              ),
              DataColumn(
                label: Text('Preis'),
              ),
            ],
            rows: rows,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return ScannerView();
          },
        ).then((barcode) {
          ScannedItem result = excel.getItemFromBarcode(barcode);
          print(barcode);
          if (result != null)
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddItemView(result);
              },
            ).then(
              (element) {
                if (element != null) {
                  setState(
                    () {
                      this.barcode = barcode;
                      rows.add(
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(element.artNr)),
                            DataCell(Text(element.bezeichnung)),
                            DataCell(Text(element.anzahl.toString())),
                            DataCell(Text(element.kategorie)),
                            DataCell(Text(element.preis.toString())),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            );
        }),
      ),
    );
  }
}
