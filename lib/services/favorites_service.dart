import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/repositories/favories_repository.dart';

class FavoriesService {

  final FavoritesRepository favoriesRepository = FavoritesRepository();

  void storeCharacterAsFavorite(Character character) {

  }

  void removeCharacterFromFavorite(int characterId) {
    favoriesRepository.removeCharacterFromFavorites(characterId);
  }

  List<Character> getFavoritesCharacters() {
    return favoriesRepository.getFavoritesCharacters();
  }

  bool isCharacterAlreadyFavorite(int characterId) {
    return favoriesRepository.getCharacter(characterId) != null;
  }
}