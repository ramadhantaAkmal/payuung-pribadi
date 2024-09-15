import 'package:payuung_pribadi/data/hive_database/wellness.dart';

class WellnessServiceModel {
  final String name, image;
  final double price, discount;
  final bool isDiscount;

  const WellnessServiceModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.discount,
      required this.isDiscount});

  Wellness toBoxes() => Wellness(
        name: name,
        image: image,
        price: price,
        discount: discount,
        isDiscount: isDiscount,
      );

  factory WellnessServiceModel.fromBoxes(Wellness box) => WellnessServiceModel(
        name: box.name,
        image: box.image,
        price: box.price,
        discount: box.discount,
        isDiscount: box.isDiscount,
      );
}
