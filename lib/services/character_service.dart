import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/repositories/character_repository.dart';

/// A Character [Service] that manage corresponding repository
///
/// {@category Services}
class CharacterService {
  final CharacterRepository _characterRepository = CharacterRepository();

  /// Get a list of [Character] by a [characterName]
  ///
  /// [characterName] : The character's name
  Future<List<Character>> findByCharacterByName(String characterName) async {
    return await _characterRepository.findCharactersByName(characterName);
  }

  /// Get a specific [Character] by it's [characterId]
  ///
  /// [characterId] : The character's id
  Future<Character> findCharacterById(int characterId) async {
    return await _characterRepository.findCharacterById(characterId);
  }

}