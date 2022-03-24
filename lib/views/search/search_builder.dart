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

  TextEditingController searchController = TextEditingController();

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
              controller: searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: CustomTheme.regularBorderRadius
                  )
              ),
              onEditingComplete:  () {
                if(searchController.text.length > 3) {
                  BlocProvider.of<SearchBloc>(context).add(SearchCharacterEvent(searchInput: searchController.text));
                }
              },
            ),
          ),
          const Divider(thickness: 2, height: 4,),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state is SearchCharactersFetchedState) {
                return SearchView(characters: state.characters);
              } else if(state is NoResultSearchCharactersState) {
                return const SearchEmpty();
              } else if(state is SearchingCharactersState) {
                return const LoadingIndicator();
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
    super.dispose();
  }
}
