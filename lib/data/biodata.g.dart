// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biodata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BiodataAdapter extends TypeAdapter<Biodata> {
  @override
  final int typeId = 1;

  @override
  Biodata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Biodata(
      name: fields[0] as String,
      birthDate: fields[1] as DateTime,
      gender: fields[2] as String,
      email: fields[3] as String,
      phoneNumber: fields[4] as String,
      education: fields[5] as String,
      maritalStatus: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Biodata obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthDate)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.education)
      ..writeByte(6)
      ..write(obj.maritalStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BiodataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
