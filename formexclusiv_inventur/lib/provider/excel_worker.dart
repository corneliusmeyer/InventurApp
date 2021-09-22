import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';

class ExcelWorker {
  var excel;
  PlatformFile file;
  ExcelWorker(PlatformFile file) {
    this.file = file;
    var bytes = File(file.path).readAsBytesSync();
    excel = Excel.decodeBytes(bytes);
    print("Path::: " + file.path);
  }

  void addData(String artNr, String schluessel, int menge) {}

  ScannedItem getItemFromBarcode(String barcode) {
    for (var table in excel.tables.keys) {
      List<dynamic> rows = excel.tables[table].rows;
      for (int i = 1; i < rows.length; i++) {
        dynamic row = rows[i];
        if (row[0] == barcode) {
          String artNr;
          String bezeichnung;
          int anzahl;
          String kategorie;
          double preis;
          artNr = row[0].toString();
          if (row.length >= 1 && row[1] != null)
            bezeichnung = row[1].toString();
          if (row.length >= 2 && row[2] != null) kategorie = row[2].toString();
          if (row.length >= 3 && row[3] != null)
            anzahl = int.tryParse(row[3].toString());
          if (row.length >= 4 && row[4] != null)
            preis = double.tryParse(row[4].toString());
          return new ScannedItem(artNr, bezeichnung, anzahl, kategorie, preis);
        }
      }
    }
    return null;
  }

  void updateItem(ScannedItem s) {
    String id = s.artNr;
    var table = excel.tables.keys.toList()[0];
    List<dynamic> rows = excel.tables[table].rows;
    for (int i = 1; i < rows.length; i++) {
      dynamic row = rows[i];
      if (row.elementAt(0) == id) {
        excel.updateCell(
          table,
          CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i),
          s.kategorie,
        );
        excel.updateCell(
          table,
          CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i),
          s.preis.toString(),
        );
        excel.updateCell(
          table,
          CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i),
          s.anzahl.toString(),
        );
      }
    }
  }

  List<String> readKategorien() {
    List<String> kategorien = [];
    for (var table in excel.tables.keys) {
      List<dynamic> rows = excel.tables[table].rows;
      for (int i = 1; i < rows.length; i++) {
        dynamic row = rows[i];
        String kategorie = row[2].toString();
        if (kategorie != "null" && !kategorien.contains(kategorie)) {
          kategorien.add(kategorie);
          print(kategorie);
        }
      }
    }
    return kategorien;
  }

  List<ScannedItem> getScannedItems() {
    List<ScannedItem> scans = [];
    for (var table in excel.tables.keys) {
      List<dynamic> rows = excel.tables[table].rows;
      for (int i = 1; i < rows.length; i++) {
        dynamic row = rows[i];
        if (_scanForNull(row)) continue;
        print(row[1].toString() + "  " + row[4].toString());
        if (row[4] != 0 && row[4].toString() != "null") {
          String artNr = row[0];
          String bezeichnung = row[1] == null ? "leer" : row[1];
          String kategorie = row[2] == null ? "leer" : row[2];
          double preis = double.tryParse(row[3].toString());
          int menge = int.tryParse(row[4].toString());
          scans.add(
            new ScannedItem(artNr, bezeichnung, menge, kategorie, preis),
          );
        }
      }
    }
    return scans;
  }

  bool _scanForNull(List<dynamic> row) {
    return row[0] == null ||
        row[0] == "null" ||
        row[1] == null ||
        row[1] == "null" ||
        row[2] == null ||
        row[2] == "null" ||
        row[3] == null ||
        row[3] == "null" ||
        row[4] == null ||
        row[4] == "null" ||
        row[5] == null ||
        row[5] == "null";
  }

  void saveExcel() {
    excel.encode().then((onValue) {
      File(file.path)
        ..createSync(recursive: false)
        ..writeAsBytesSync(onValue);
    });
    print(file.path);
  }
}
