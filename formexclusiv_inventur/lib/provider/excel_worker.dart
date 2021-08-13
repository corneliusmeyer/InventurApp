import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';

class ExcelWorker {
  var excel;
  ExcelWorker(PlatformFile file) {
    var bytes = File(file.path).readAsBytesSync();
    excel = Excel.decodeBytes(bytes);
  }

  void addData(String artNr, String schluessel, int menge) {}

  ScannedItem getItemFromBarcode(String barcode) {
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        if (row.elementAt(0).toString() == barcode) {
          String artNr;
          String bezeichnung;
          int anzahl;
          String kategorie;
          double preis;
          artNr = row.elementAt(0).toString();
          if (row.length >= 1 && row.elementAt(1) != null)
            bezeichnung = row.elementAt(1).toString();
          if (row.length >= 2 && row.elementAt(2) != null)
            kategorie = row.elementAt(2).toString();
          if (row.length >= 3 && row.elementAt(3) != null)
            anzahl = int.tryParse(row.elementAt(3).toString());
          if (row.length >= 4 && row.elementAt(4) != null)
            preis = double.tryParse(row.elementAt(4).toString());
          return new ScannedItem(artNr, bezeichnung, anzahl, kategorie, preis);
        }
      }
    }
    return null;
  }

  List<String> readKategorien() {
    List<String> kategorien = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        String kategorie = row.elementAt(2).toString();
        if (kategorie != "null" && !kategorien.contains(kategorie)) {
          kategorien.add(kategorie);
          print(kategorie);
        }
      }
    }
    return kategorien;
  }

  List<DataRow> buildItemData() {
    List<DataRow> data = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        data.add(DataRow(cells: <DataCell>[
          DataCell(Text(row.elementAt(0).toString())),
          DataCell(Text(row.elementAt(1).toString())),
          DataCell(Text(row.elementAt(1).toString())),
          DataCell(Text(row.elementAt(1).toString())),
          DataCell(Text(row.elementAt(1).toString())),
        ]));
      }
      return data;
    }
  }

  ScannedItem getData() {
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        //
        print("$row");
      }
    }
  }
}
