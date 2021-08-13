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
  List<ScannedItem> scans = [];
  @override
  void initState() {
    excel = new ExcelWorker(widget.inventur.inventur_file);
    widget.inventur.setup(excel);
    scans = excel.getScannedItems();
  }

  String barcode = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              for (ScannedItem s in scans) {
                excel.updateItem(s);
              }
              excel.saveExcel();
            },
          )
        ],
      ),
      body: scans.length > 0
          ? SingleChildScrollView(
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
                  rows: showAllScans(scans),
                ),
              ),
            )
          : Text('Drücke auf das Scan Symbol um ein Produkt einzuscanen.'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.document_scanner),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return ScannerView();
          },
        ).then((barcode) {
          if (barcode == null) return;
          ScannedItem result = excel.getItemFromBarcode(barcode);
          if (result != null)
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddItemView(result, widget.inventur.kategorien);
              },
            ).then(
              (element) {
                if (element != null) {
                  setState(
                    () {
                      scans.add(element);
                      this.barcode = barcode;
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

List<DataRow> showAllScans(List<ScannedItem> scans) {
  List<DataRow> rows = [];
  for (ScannedItem element in scans) {
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
  }
  return rows;
}
