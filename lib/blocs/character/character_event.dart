part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();
}

class FetchCharacterByIdEvent extends CharacterEvent {

  final int id;

  const FetchCharacterByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class AddCharacterToFavoriteEvent extends CharacterEvent {

  final Character character;

  const AddCharacterToFavoriteEvent({required this.character});

  @override
  List<Object> get props => [character];
}

class RemoveCharacterFromFavoriteEvent extends CharacterEvent {

  final Character character;

  const RemoveCharacterFromFavoriteEvent({required this.character});

  @override
  List<Object?> get props => [character];
}