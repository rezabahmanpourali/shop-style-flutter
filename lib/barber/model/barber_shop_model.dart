import 'package:shop_style/barber/model/comment_model.dart';

class BarberShopModel {
  final int? id;
  final String? barberShopName;
  final bool? isActive;
  final String? shopType;
  final List<CommentModel>? comments;
  final List<ImageeModel>? images;
  final Location? location;
  bool isBookmarked;

  BarberShopModel({
    this.id,
    this.barberShopName,
    this.isActive,
    this.shopType,
    this.comments,
    this.images,
    this.location,
    this.isBookmarked = false,
  });

  factory BarberShopModel.fromJson(Map<String, dynamic> json) {
    return BarberShopModel(
      id: json['id'],
      barberShopName: json['barber_shop_name'],
      isActive: json['is_active'],
      shopType: json['shop_type'],
      comments: (json['comments'] as List?)
          ?.map((e) => CommentModel.fromJson(e))
          .toList(),
      images: (json['images'] as List?)
          ?.map((e) => ImageeModel.fromJson(e))
          .toList(),
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }
}

class ImageeModel {
  final int? id;
  final String? fileName;
  final String? url;

  ImageeModel({
    this.id,
    this.fileName,
    this.url,
  });

  factory ImageeModel.fromJson(Map<String, dynamic> json) {
    return ImageeModel(
      id: json['id'],
      fileName: json['file_name'],
      url: json['url'],
    );
  }
}

class Location {
  final double? latitude;
  final double? longitude;
  final int? id;

  Location({
    this.latitude,
    this.longitude,
    this.id,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
      id: json['id'],
    );
  }
}
