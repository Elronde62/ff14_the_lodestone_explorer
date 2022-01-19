import 'dart:async';

import 'package:ff14_mobile_app/blocs/search/search_bloc.dart';
import 'package:ff14_mobile_app/components/loading_indicator.dart';
import 'package:ff14_mobile_app/config/custom_theme.dart';
import 'package:ff14_mobile_app/views/search/components/search_empty.dart';
import 'package:ff14_mobile_app/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBuilder extends StatefulWidget {
  const SearchBuilder({Key? key}) : super(key: key);

  @override
  State<SearchBuilder> createState() => _SearchBuilderState();
}

class _SearchBuilderState extends State<SearchBuilder> {

  late Timer _debounce;

  /// Handle on change debouncer to avoid to many queries
  _onSearchChanged(String value) {

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if(value.length > 3) {
        BlocProvider.of<SearchBloc>(context).add(SearchCharacterEvent(searchInput: value));
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.searchCharacters, style: Theme.of(context).textTheme.headline5),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: CustomTheme.regularBorderRadius
                  )
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          const Divider(thickness: 2, height: 4,),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state is SearchCharactersFetched) {
                return SearchView(characters: state.characters);
              } else if(state is NoResultSearchCharacters) {
                return const SearchEmpty();
              }

              return const LoadingIndicator();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debounce.cancel();
    super.dispose();
  }
}
