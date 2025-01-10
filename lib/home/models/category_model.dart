class CategoryItems {
  final int id;
  final String fileName;
  final String url;

  CategoryItems({
    required this.id,
    required this.fileName,
    required this.url,
  });

  factory CategoryItems.fromJson(Map<String, dynamic> json) {
    return CategoryItems(
      id: json['id'],
      fileName: json['file_name'],
      url: json['url'],
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

class CategoryModel {
  final String title;
  final int id;
  final List<CategoryItems> images;

  CategoryModel({
    required this.title,
    required this.id,
    required this.images,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var imageList = (json['images'] as List)
        .map((imageJson) => CategoryItems.fromJson(imageJson))
        .toList();

    return CategoryModel(
      title: json['title'],
      id: json['id'],
      images: imageList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}
