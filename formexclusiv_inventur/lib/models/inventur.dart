import 'package:formexclusiv_inventur/provider/excel_worker.dart';

class Inventur {
  //PlatformFile inventur_file;
  String inventur_file;
  List<String> kategorien = [];

  Inventur(this.inventur_file);

  void setup(ExcelWorker ew) {
    kategorien = ew.readKategorien();
  }
}
