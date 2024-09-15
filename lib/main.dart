import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payuung_pribadi/core/boxes.dart';
import 'package:payuung_pribadi/data/database_service.dart';
import 'package:payuung_pribadi/data/hive_database/address.dart';
import 'package:payuung_pribadi/data/hive_database/biodata.dart';
import 'package:payuung_pribadi/data/hive_database/company.dart';
import 'package:payuung_pribadi/data/hive_database/wellness.dart';
import 'package:payuung_pribadi/misc/list_data.dart';
import 'package:payuung_pribadi/view/home/home.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(BiodataAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(WellnessAdapter());
  addressBox = await Hive.openBox<Address>('addressBox');
  biodataBox = await Hive.openBox<Biodata>('biodataBox');
  companyBox = await Hive.openBox<Company>('companyBox');
  wellnessBox = await Hive.openBox<List<dynamic>>('wellnessBox');
  initiateWellnesData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(color: Colors.grey.shade100),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.grey.shade100),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

void initiateWellnesData() async {
  List<Wellness> wellnessdata =
      exploreWellness.map((e) => e.toBoxes()).toList();
  await BoxesServices.putDataWellness(wellnessdata);
}
