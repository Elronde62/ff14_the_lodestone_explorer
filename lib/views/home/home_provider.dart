import 'package:ff14_mobile_app/blocs/home/home_bloc.dart';
import 'package:ff14_mobile_app/components/loading_indicator.dart';
import 'package:ff14_mobile_app/views/home/components/home_empty.dart';
import 'package:ff14_mobile_app/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context ) => HomeBloc()..add(FetchCharactersHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if(state is CharactersFetchedHomeState) {
            return HomeView(
              favoritesCharacters: state.characters,
            );
          } else if(state is NoCharactersInFavoriteHomeState) {
            return const HomeEmpty();
          }

          return const LoadingIndicator();
        },
      ),
    );
  }
}
