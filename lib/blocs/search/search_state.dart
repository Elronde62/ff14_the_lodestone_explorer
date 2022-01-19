part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchCharactersFetched extends SearchState {
  final List<Character> characters;

  const SearchCharactersFetched({required this.characters});

  @override
  List<Object> get props => [characters];
}

class NoResultSearchCharacters extends SearchState {

  @override
  List<Object?> get props => [];


}