import 'package:shop_style/barber/model/comment_model.dart';

class BarberShopModel {
  final int? id;
  final String? barberShopName;
  final bool? isActive;
  final List<CommentModel>? comments;
  final List<ImageModel>? images;
  final Location? location;

  BarberShopModel({
    this.id,
    this.barberShopName,
    this.isActive,
    this.comments,
    this.images,
    this.location,
  });

  factory BarberShopModel.fromJson(Map<String, dynamic> json) {
    return BarberShopModel(
      id: json['id'],
      barberShopName: json['barber_shop_name'],
      isActive: json['is_active'],
      comments: (json['comments'] as List?)
          ?.map((e) => CommentModel.fromJson(e))
          .toList(),
      images: (json['images'] as List?)
          ?.map((e) => ImageModel.fromJson(e))
          .toList(),
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
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

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
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
