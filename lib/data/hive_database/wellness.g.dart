// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WellnessAdapter extends TypeAdapter<Wellness> {
  @override
  final int typeId = 4;

  @override
  Wellness read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wellness(
      name: fields[0] as String,
      image: fields[1] as String,
      price: fields[2] as double,
      discount: fields[3] as double,
      isDiscount: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Wellness obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.discount)
      ..writeByte(4)
      ..write(obj.isDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WellnessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
