import 'package:hive/hive.dart';

part 'company.g.dart';

@HiveType(typeId: 3)
class Company {
  Company(
      {required this.companyName,
      required this.companyAddress,
      required this.position,
      required this.professionalLifetime,
      required this.incomeSource,
      required this.incomeGrossSource,
      required this.bankName,
      required this.bankBranchName,
      required this.accountNumber,
      required this.accountName});

  @HiveField(0)
  String companyName;

  @HiveField(1)
  String companyAddress;

  @HiveField(2)
  String position;

  @HiveField(3)
  String professionalLifetime;

  @HiveField(4)
  String incomeSource;

  @HiveField(5)
  String incomeGrossSource;

  @HiveField(6)
  String bankName;

  @HiveField(7)
  String bankBranchName;

  @HiveField(8)
  String accountNumber;

  @HiveField(9)
  String accountName;
}
