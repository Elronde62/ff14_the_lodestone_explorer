part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class CharactersFetchedHomeState extends HomeState {

  final List<Character> characters;

  const CharactersFetchedHomeState({required this.characters});

  @override
  List<Object?> get props => [characters];

}

class NoCharactersInFavoriteHomeState extends HomeState {
  @override
  List<Object?> get props => [];


}