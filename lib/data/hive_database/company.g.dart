// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 3;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      companyName: fields[0] as String,
      companyAddress: fields[1] as String,
      position: fields[2] as String,
      professionalLifetime: fields[3] as String,
      incomeSource: fields[4] as String,
      incomeGrossSource: fields[5] as String,
      bankName: fields[6] as String,
      bankBranchName: fields[7] as String,
      accountNumber: fields[8] as String,
      accountName: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.companyAddress)
      ..writeByte(2)
      ..write(obj.position)
      ..writeByte(3)
      ..write(obj.professionalLifetime)
      ..writeByte(4)
      ..write(obj.incomeSource)
      ..writeByte(5)
      ..write(obj.incomeGrossSource)
      ..writeByte(6)
      ..write(obj.bankName)
      ..writeByte(7)
      ..write(obj.bankBranchName)
      ..writeByte(8)
      ..write(obj.accountNumber)
      ..writeByte(9)
      ..write(obj.accountName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
