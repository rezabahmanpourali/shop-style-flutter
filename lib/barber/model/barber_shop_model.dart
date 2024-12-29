class BarberShopModel {
  final String? barberShopName;
  final String? barberShopImage;
  final bool? isActive;
  final int? id;

  BarberShopModel(
    this.barberShopName,
    this.barberShopImage,
    this.isActive,
    this.id,
  );

  factory BarberShopModel.fromJsone(Map<String, dynamic> jsonObject) {
    return BarberShopModel(
      jsonObject['barber_shop_name'],
      jsonObject['barber_shop_image'],
      jsonObject['is_active'],
      jsonObject['id'],
    );
  }
}
