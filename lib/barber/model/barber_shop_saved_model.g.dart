// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber_shop_saved_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarberShopSavedModelAdapter extends TypeAdapter<BarberShopSavedModel> {
  @override
  final int typeId = 1;

  @override
  BarberShopSavedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BarberShopSavedModel(
      fields[0] as int?,
      barberShopName: fields[1] as String?,
      imageUrl: fields[2] as String?,
      isBookmarked: fields[3] as bool,
      shopType: fields[4] as String?,
      isActive: fields[5] as bool?,
      comments: (fields[6] as List?)?.cast<CommentModel>(),
      images: (fields[7] as List?)?.cast<ImageModel>(),
      location: fields[8] as Location?,
    );
  }

  @override
  void write(BinaryWriter writer, BarberShopSavedModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.barberShopName)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.isBookmarked)
      ..writeByte(4)
      ..write(obj.shopType)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.comments)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarberShopSavedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
