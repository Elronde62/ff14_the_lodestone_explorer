part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchCharactersFetchedState extends SearchState {
  final List<Character> characters;

  const SearchCharactersFetchedState({required this.characters});

  @override
  List<Object> get props => [characters];
}

class NoResultSearchCharactersState extends SearchState {

  @override
  List<Object?> get props => [];
}

class SearchingCharactersState extends SearchState {

  @override
  List<Object?> get props => [];
}