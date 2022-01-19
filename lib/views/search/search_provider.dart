import 'package:ff14_mobile_app/blocs/search/search_bloc.dart';
import 'package:ff14_mobile_app/views/search/search_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchBloc()..add(const SearchCharacterEvent(searchInput: "")),
      child: const SearchBuilder()
    );
  }
}
