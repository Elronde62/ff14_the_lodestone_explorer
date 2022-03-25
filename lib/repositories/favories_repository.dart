import 'package:ff14_mobile_app/core/repository.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/models/character_hive.dart';
import 'package:hive/hive.dart';

/// Favorites [Repository] that handle favorites resource retrieving
///
/// {@category Repositories}
class FavoritesRepository extends Repository {

  /// Store a [character] in local
  ///
  /// [character] : The character to save
  void storeCharacterInFavorites(Character character) async {
    var charHive = CharacterHive(id: character.id, name: character.name, avatar: character.avatar, server: character.server);
    Box<CharacterHive> box = Hive.box('charactersBox');
    box.add(charHive);
  }

  /// Remove a character from local HiveDB by it's [characterId]
  ///
  /// [characterId] : The character's id
  void removeCharacterFromFavorites(int characterId) async {
    Box<CharacterHive> box = Hive.box('charactersBox');
    for(var key in box.keys) {
      if(box.get(key)?.id == characterId) {
        box.delete(key);
        break;
      }
    }

  }

  /// Get a list of every [Character] stored in local favorites
  ///
  /// Return a list of [Character] from local favorites
  List<Character> getFavoritesCharacters() {
    Box<CharacterHive> box = Hive.box('charactersBox');
    var charactersHive = box.values;
    return charactersHive.map((e) => Character(id: e.id, name: e.name, avatar: e.avatar, server: e.server)).toList();
  }

  /// Get a specific local character by it's [id]
  ///
  /// Return a [Character] if it's exists or null
  Character? getCharacter(int id) {
    Box<CharacterHive> box = Hive.box('charactersBox');
    var charactersHive = box.values;
    List<Character> character = charactersHive.where((element) => element.id == id).map((e) => Character(id: e.id, name: e.name, avatar: e.avatar, server: e.server)).toList();
    return character.isNotEmpty ? character.first : null;
  }
}