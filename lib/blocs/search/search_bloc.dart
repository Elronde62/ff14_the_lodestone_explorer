import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/services/character_service.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    CharacterService characterService = CharacterService();

    on<SearchEvent>((event, emit) async {
        if(event is SearchCharacterEvent) {
          List<Character> characters = await characterService.findByCharacterByName(event.searchInput);
          // Return the empty state
          if(characters.isEmpty) {
            emit(NoResultSearchCharacters());
          } else {
            emit(SearchCharactersFetched(characters: characters));
          }

        }
    });
  }
}
