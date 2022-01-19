import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/repositories/character_repository.dart';

class CharacterService {
  final CharacterRepository _characterRepository = CharacterRepository();

  Future<List<Character>> findByCharacterByName(String characterName) async {
    return await _characterRepository.findCharactersByName(characterName);
  }

  Future<Character> findCharacterById(int characterId) async {
    return await _characterRepository.findCharacterById(characterId);
  }

}