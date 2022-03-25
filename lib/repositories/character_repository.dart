import 'package:ff14_mobile_app/core/repository.dart';
import 'package:ff14_mobile_app/models/character.dart';

/// Character [Repository] that handle character resource retrieving
///
/// {@category Repositories}
class CharacterRepository extends Repository {

  /// Find a list of characters by [characterName]
  ///
  /// [characterName] : The character's name
  /// Return a list of [Character] that correspond to the search or an empty array if not matching resources
  Future<List<Character>> findCharactersByName(String characterName) async {
    /// Convert space to +
    characterName.replaceAll(' ', '+');
    var response = await getHttp("/character/search?name=$characterName");

    // When no response, then return an empty array
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

  /// Find a specific character by it's [id]
  ///
  ///  [characterId] : The character's id
  /// Return a [Character] by it's id
  Future<Character> findCharacterById(int characterId, {int isExtended = 1}) async {
    var response = await getHttp("/character/${characterId.toString()}?extended=$isExtended&data=MIMO");
    var data = response.data;
    return Character.fromJson(data);
  }
}