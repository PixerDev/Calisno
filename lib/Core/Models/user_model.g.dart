// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      age: fields[0] as int,
      weight: fields[1] as double,
      height: fields[2] as double,
      name: fields[3] as String,
      gender: fields[4] as Gender,
      activityLevel: fields[5] as ActivityLevel,
      bodyFat: fields[6] as int?,
      profileComplete: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.activityLevel)
      ..writeByte(6)
      ..write(obj.bodyFat)
      ..writeByte(7)
      ..write(obj.profileComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
