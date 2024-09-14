import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address {
  Address(
      {required this.nik,
      required this.address,
      required this.province,
      required this.city,
      required this.kecamatan,
      required this.kelurahan,
      required this.postalCode,
      this.domicileAddress,
      this.domicileProvince,
      this.domicileCity,
      this.domicileKecamatan,
      this.domicileKelurahan,
      this.domicilePostCode});

  @HiveField(0)
  String nik;

  @HiveField(1)
  String address;

  @HiveField(2)
  String province;

  @HiveField(3)
  String city;

  @HiveField(4)
  String kecamatan;

  @HiveField(5)
  String kelurahan;

  @HiveField(6)
  String postalCode;

  @HiveField(7)
  String? domicileAddress;

  @HiveField(8)
  String? domicileProvince;

  @HiveField(9)
  String? domicileCity;

  @HiveField(10)
  String? domicileKecamatan;

  @HiveField(11)
  String? domicileKelurahan;

  @HiveField(12)
  String? domicilePostCode;
}
