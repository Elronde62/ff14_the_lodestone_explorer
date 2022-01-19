import 'package:ff14_mobile_app/core/repository.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:logger/logger.dart';

class CharacterRepository extends Repository {
  Logger l = Logger();

  /// Find a list of characters by name
  ///
  /// @param String characterName: The name of the character
  /// Return a list of characters that correspond to the search
  Future<List<Character>> findCharactersByName(String characterName) async {
    /// Convert space to +
    characterName.replaceAll(' ', '+');
    var response = await getHttp("/character/search?name=$characterName");

    if(response == null) {
      return [];
    }

    Map data = response.data;


    var charactersArr = data["Results"];
    List<Character> characters = [];
    for(var char in charactersArr) {
      characters.add(Character.fromJson(char));
    }
    return characters;
  }

  /// Find a specific character by it's id
  ///
  /// @param int characterId: The character's id
  /// Return a character by it's id
  Future<Character> findCharacterById(int characterId, {int isExtended = 1}) async {
    var response = await getHttp("/character/${characterId.toString()}?extended=$isExtended&data=MIMO");
    var data = response.data;
    return Character.fromJson(data);
  }
}