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

  factory BarberShopModel.fromJson(Map<String, dynamic> jsonObject) {
    return BarberShopModel(
      jsonObject['barber_shop_name'],
      jsonObject['images'] != null && jsonObject['images'].isNotEmpty
          ? jsonObject['images'][0]['url']
          : null,
      jsonObject['is_active'],
      jsonObject['id'],
    );
  }
}
