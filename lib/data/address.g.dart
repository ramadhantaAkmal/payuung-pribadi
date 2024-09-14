// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 1;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      nik: fields[0] as String,
      address: fields[1] as String,
      province: fields[2] as String,
      city: fields[3] as String,
      kecamatan: fields[4] as String,
      kelurahan: fields[5] as String,
      postalCode: fields[6] as String,
      domicileAddress: fields[7] as String?,
      domicileProvince: fields[8] as String?,
      domicileCity: fields[9] as String?,
      domicileKecamatan: fields[10] as String?,
      domicileKelurahan: fields[11] as String?,
      domicilePostCode: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.nik)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.province)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.kecamatan)
      ..writeByte(5)
      ..write(obj.kelurahan)
      ..writeByte(6)
      ..write(obj.postalCode)
      ..writeByte(7)
      ..write(obj.domicileAddress)
      ..writeByte(8)
      ..write(obj.domicileProvince)
      ..writeByte(9)
      ..write(obj.domicileCity)
      ..writeByte(10)
      ..write(obj.domicileKecamatan)
      ..writeByte(11)
      ..write(obj.domicileKelurahan)
      ..writeByte(12)
      ..write(obj.domicilePostCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
