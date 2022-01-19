part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchCharacterEvent extends SearchEvent {
  final String searchInput;

  const SearchCharacterEvent({required this.searchInput});
  @override
  List<Object> get props => [searchInput];
}

class SearchCharacterByIdEvent extends SearchEvent {
  final int characterId;

  const SearchCharacterByIdEvent({required this.characterId});
  @override
  List<Object> get props => [characterId];
}