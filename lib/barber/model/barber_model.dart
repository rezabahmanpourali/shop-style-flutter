class BarberModel {
  final int? id;
  final String? barberName;
  final int? barberShopId;
  final List<ImageModel>? images;

  BarberModel({
    this.id,
    this.barberName,
    this.barberShopId,
    this.images,
  });

  factory BarberModel.fromJson(Map<String, dynamic> jsonObject) {
    return BarberModel(
      id: jsonObject['id'],
      barberName: jsonObject['barber_name'],
      barberShopId: jsonObject['barber_shop_id'],
      images: (jsonObject['images'] as List<dynamic>?)
          ?.map((image) => ImageModel.fromJson(image))
          .toList(),
    );
  }
}

class ImageModel {
  final int? id;
  final String? fileName;
  final String? url;

  ImageModel({
    this.id,
    this.fileName,
    this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> jsonObject) {
    return ImageModel(
      id: jsonObject['id'],
      fileName: jsonObject['file_name'],
      url: jsonObject['url'],
    );
  }
}
