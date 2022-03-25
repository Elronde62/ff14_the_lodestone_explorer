import 'package:hive/hive.dart';

part 'character_hive.g.dart';

/// A character model that parse data to local Hive
///
/// {@category Models}
@HiveType(typeId: 1)
class CharacterHive {

  @HiveField(0)
  int id;
  
  @HiveField(1)
  String name;
  
  @HiveField(2)
  String avatar;
  
  @HiveField(3)
  String server;

  CharacterHive({required this.id, required this.name, required this.avatar, required this.server});

}