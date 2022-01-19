import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/services/favorites_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    FavoriesService favoriesService = FavoriesService();
    on<HomeEvent>((event, emit) {

      if(event is FetchCharactersHomeEvent) {
        List<Character> characters = favoriesService.getFavoritesCharacters();
        // Check if there are characters in the favorites lists
        if(characters.isEmpty) {
          emit(NoCharactersInFavoriteHomeState());
        } else {
          // Sort the characters list by alphabetical order
          characters.sort((a, b ) => a.name.compareTo(b.name));
          emit(CharactersFetchedHomeState(characters: characters));
        }
      }
    });
  }
}
