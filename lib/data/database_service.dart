import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/data/hive_database/address.dart';
import 'package:payuung_pribadi/data/hive_database/biodata.dart';
import 'package:payuung_pribadi/data/hive_database/company.dart';
import 'package:payuung_pribadi/data/hive_database/wellness.dart';

class BoxesServices {
  static putDataAddress(Address data) async {
    addressBox.clear();
    addressBox.add(data);
  }

  static putDataBiodata(Biodata data) async {
    addressBox.clear();
    biodataBox.add(data);
  }

  static putDataCompany(Company data) async {
    addressBox.clear();
    companyBox.add(data);
  }

  static putDataWellness(List<Wellness> data) async {
    wellnessBox.add(data);
  }
}
