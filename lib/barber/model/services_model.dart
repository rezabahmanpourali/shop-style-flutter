class Categoryy {
  final String title;
  final int id;
  final List<ImageData> images;

  Categoryy({required this.title, required this.id, required this.images});

  factory Categoryy.fromJson(Map<String, dynamic> json) {
    var list = json['images'] as List;
    List<ImageData> imagesList =
        list.map((i) => ImageData.fromJson(i)).toList();

    return Categoryy(
      title: json['title'],
      id: json['id'],
      images: imagesList,
    );
  }
}

class HairModel {
  final String name;
  final int id;
  final List<ImageData> images;

  HairModel({required this.name, required this.id, required this.images});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    var list = json['images'] as List;
    List<ImageData> imagesList =
        list.map((i) => ImageData.fromJson(i)).toList();

    return HairModel(
      name: json['name'],
      id: json['id'],
      images: imagesList,
    );
  }
}

class ImageData {
  final int id;
  final String fileName;
  final String url;

  ImageData({required this.id, required this.fileName, required this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      fileName: json['file_name'],
      url: json['url'],
    );
  }
}

class ServiceModel {
  final int id;
  final int barberShopId;
  final int hairModelId;
  final int price;
  final int discountPercentage;
  final int categoryId;
  final Categoryy category;
  final HairModel hairModel;

  ServiceModel({
    required this.id,
    required this.barberShopId,
    required this.hairModelId,
    required this.price,
    required this.discountPercentage,
    required this.categoryId,
    required this.category,
    required this.hairModel,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      barberShopId: json['barber_shop_id'],
      hairModelId: json['hair_model_id'],
      price: (json['price'] as num).toInt(),
      discountPercentage: (json['discount_percentage'] as num).toInt(),
      categoryId: json['category_id'],
      category: Categoryy.fromJson(json['category']),
      hairModel: HairModel.fromJson(json['hair_model']),
    );
  }
}
