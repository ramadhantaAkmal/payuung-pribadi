import 'package:hive/hive.dart';

part 'biodata.g.dart';

@HiveType(typeId: 2)
class Biodata {
  Biodata({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.education,
    required this.maritalStatus,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime birthDate;

  @HiveField(2)
  String gender;

  @HiveField(3)
  String email;

  @HiveField(4)
  String phoneNumber;

  @HiveField(5)
  String education;

  @HiveField(6)
  String maritalStatus;
}
