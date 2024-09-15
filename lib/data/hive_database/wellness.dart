import 'package:hive/hive.dart';

part 'wellness.g.dart';

@HiveType(typeId: 4)
class Wellness {
  Wellness(
      {required this.name,
      required this.image,
      required this.price,
      required this.discount,
      required this.isDiscount});

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  double price;

  @HiveField(3)
  double discount;

  @HiveField(4)
  bool isDiscount;
}
