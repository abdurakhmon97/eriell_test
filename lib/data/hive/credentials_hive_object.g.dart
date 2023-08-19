// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CredentialsHiveObjectAdapter extends TypeAdapter<CredentialsHiveObject> {
  @override
  final int typeId = 0;

  @override
  CredentialsHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CredentialsHiveObject(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CredentialsHiveObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CredentialsHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
