class BarberModel {
  final int? id;
  final String? barberName;
  final int? barberShopId;

  BarberModel(
    this.id,
    this.barberName,
    this.barberShopId,
  );

  factory BarberModel.fromJson(Map<String, dynamic> jsonObject) {
    return BarberModel(
      jsonObject['id'],
      jsonObject['barber_name'],
      jsonObject['barber_shop_id'],
    );
  }
}
