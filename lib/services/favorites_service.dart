import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/repositories/favorites_repository.dart';

/// A Favorites [Service] that handle favorites calls
///
/// {@category Services}
class FavoritesService {

  final FavoritesRepository favoritesRepository = FavoritesRepository();

  /// Remove a specific [Character] from lom favorites by it's [characterId]
  void removeCharacterFromFavorite(int characterId) {
    favoritesRepository.removeCharacterFromFavorites(characterId);
  }

  /// Get a list of every [Character] stored in local
  List<Character> getFavoritesCharacters() {
    return favoritesRepository.getFavoritesCharacters();
  }

  /// Check if a [Character] is already stored as favorites by its [characterId]
  bool isCharacterAlreadyFavorite(int characterId) {
    return favoritesRepository.getCharacter(characterId) != null;
  }
}