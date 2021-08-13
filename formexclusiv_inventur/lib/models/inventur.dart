import 'package:file_picker/file_picker.dart';
import 'package:formexclusiv_inventur/models/scanned_item.dart';
import 'package:formexclusiv_inventur/provider/excel_worker.dart';

class Inventur {
  PlatformFile inventur_file;
  String name;
  List<String> kategorien = [];

  Inventur(this.name, this.inventur_file);

  void setup(ExcelWorker ew) {
    kategorien = ew.readKategorien();
  }
}
