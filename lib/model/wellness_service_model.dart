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
}
