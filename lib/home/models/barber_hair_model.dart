class HairModel {
  final String? name;
  final int? id;
  final List<ImageModel> images;

  HairModel(this.name, this.id, this.images);

  factory HairModel.fromJson(Map<String, dynamic> json) {
    var imagesList = (json['images'] as List)
        .map((imageJson) => ImageModel.fromJson(imageJson))
        .toList();

    return HairModel(
      json['name'],
      json['id'],
      imagesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}

class ImageModel {
  final int? id;
  final String? fileName;
  final String? url;

  ImageModel(this.id, this.fileName, this.url);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      json['id'],
      json['file_name'],
      json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'file_name': fileName,
      'url': url,
    };
  }
}
