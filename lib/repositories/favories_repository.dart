import 'package:ff14_mobile_app/core/repository.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/models/character_hive.dart';
import 'package:hive/hive.dart';

class FavoritesRepository extends Repository {

  /// Store a character in local
  void storeCharacterInFavorites(Character character) async {
    var charHive = CharacterHive(id: character.id, name: character.name, avatar: character.avatar, server: character.server);
    Box<CharacterHive> box = Hive.box('charactersBox');
    box.add(charHive);
  }

  /// Remove a character from local HiveDB
  void removeCharacterFromFavorites(int characterId) async {
    Box<CharacterHive> box = Hive.box('charactersBox');
    for(var key in box.keys) {
      if(box.get(key)?.id == characterId) {
        box.delete(key);
        break;
      }
    }

  }

  /// Get the list of every characters stored in favorites
  List<Character> getFavoritesCharacters() {
    Box<CharacterHive> box = Hive.box('charactersBox');
    var charactersHive = box.values;
    return charactersHive.map((e) => Character(id: e.id, name: e.name, avatar: e.avatar, server: e.server)).toList();
  }

  /// Get a specific character
  Character? getCharacter(int id) {
    Box<CharacterHive> box = Hive.box('charactersBox');
    var charactersHive = box.values;
    List<Character> character = charactersHive.where((element) => element.id == id).map((e) => Character(id: e.id, name: e.name, avatar: e.avatar, server: e.server)).toList();
    return character.isNotEmpty ? character.first : null;
  }
}