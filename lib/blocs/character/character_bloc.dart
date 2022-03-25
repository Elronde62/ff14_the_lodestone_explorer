import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/repositories/favories_repository.dart';
import 'package:ff14_mobile_app/services/character_service.dart';
import 'package:ff14_mobile_app/services/favorites_service.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      CharacterService characterService = CharacterService();
      FavoritesService favoriesService = FavoritesService();

      if(event is FetchCharacterByIdEvent) {
        Character char = await characterService.findCharacterById(event.id);
        bool isCharacterFavorite = favoriesService.isCharacterAlreadyFavorite(event.id);
        emit(CharacterFetchedState(character: char, isCharacterFavorite: isCharacterFavorite));
      }
      else if(event is AddCharacterToFavoriteEvent) {
        FavoritesRepository favoriesRepository = FavoritesRepository();
        favoriesRepository.storeCharacterInFavorites(event.character);
      }
      else if(event is RemoveCharacterFromFavoriteEvent) {
        favoriesService.removeCharacterFromFavorite(event.character.id);
      }
    });
  }
}
