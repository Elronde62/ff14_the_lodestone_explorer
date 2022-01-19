import 'package:ff14_mobile_app/blocs/character/character_bloc.dart';
import 'package:ff14_mobile_app/components/loading_indicator.dart';
import 'package:ff14_mobile_app/views/characters/character_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterProvider extends StatelessWidget {
  final int id;
  const CharacterProvider({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CharacterBloc()..add(FetchCharacterByIdEvent(id: id)),
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {

          if(state is CharacterFetchedState) {
            return CharacterView(character: state.character, isCharacterFavorite: state.isCharacterFavorite,);
          }

          return const LoadingIndicator();
        },
      ),
    );
  }
}
