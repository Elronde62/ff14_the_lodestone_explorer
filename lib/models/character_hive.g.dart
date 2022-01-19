// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterHiveAdapter extends TypeAdapter<CharacterHive> {
  @override
  final int typeId = 1;

  @override
  CharacterHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterHive(
      id: fields[0] as int,
      name: fields[1] as String,
      avatar: fields[2] as String,
      server: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.avatar)
      ..writeByte(3)
      ..write(obj.server);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
