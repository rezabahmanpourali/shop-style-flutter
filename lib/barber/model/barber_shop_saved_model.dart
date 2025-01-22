import 'package:hive/hive.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';
import 'package:shop_style/barber/model/comment_model.dart';

part 'barber_shop_saved_model.g.dart';

@HiveType(typeId: 1)
class BarberShopSavedModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? barberShopName;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  bool isBookmarked;

  @HiveField(4)
  final String? shopType;

  @HiveField(5)
  final bool? isActive;

  @HiveField(6)
  final List<CommentModel>? comments;

  @HiveField(7)
  final List<ImageModel>? images;

  @HiveField(8)
  final Location? location;

  BarberShopSavedModel(
    this.id, {
    this.barberShopName,
    this.imageUrl,
    this.isBookmarked = false,
    this.shopType,
    this.isActive,
    this.comments,
    this.images,
    this.location,
  });
}

