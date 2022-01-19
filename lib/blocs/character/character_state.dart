part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterInitial extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterFetchedState extends CharacterState {

  final Character character;
  final bool isCharacterFavorite;

  const CharacterFetchedState({required this.character, this.isCharacterFavorite = false});

  @override
  List<Object> get props => [character];
}