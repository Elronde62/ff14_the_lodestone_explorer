import 'package:ff14_mobile_app/blocs/character/character_bloc.dart';
import 'package:ff14_mobile_app/config/custom_theme.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/models/class_job.dart';
import 'package:ff14_mobile_app/views/characters/components/character_gears_list.dart';
import 'package:ff14_mobile_app/views/characters/components/class_jobs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterView extends StatefulWidget {
  final Character character;
  final bool isCharacterFavorite;
  const CharacterView({Key? key, required this.character, this.isCharacterFavorite = false}) : super(key: key);

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {

  late Widget _currentDisplayedWidget;

  @override
  void initState() {
    _currentDisplayedWidget = ClassJobsList(character: widget.character);
    super.initState();
  }

  /// Toggle the gears view
  void _toggleGears() {
    if(_currentDisplayedWidget is CharacterGearsList) {
      setState(() {
        _currentDisplayedWidget = ClassJobsList(character: widget.character);
      });
    } else {
      if(widget.character.characterGears != null) {
        setState(() {
          _currentDisplayedWidget = CharacterGearsList(characterGears: widget.character.characterGears!);
        });
      }
    }
  }

  /// Is gears enabled
  bool _isGearsEnabled() {
    return _currentDisplayedWidget is CharacterGearsList;
  }

  @override
  Widget build(BuildContext context) {
    ClassJob activeClassJob = widget.character.activeClassJob!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        actions: [
          widget.isCharacterFavorite ? IconButton(
            onPressed: () {
              _showUnfavoriteDialog(context);
            },
            icon: const Icon(Icons.delete, size: 32,),
          ) :
          IconButton(
            onPressed: () {
              _showFavoriteDialog(context);
            },
            icon: const Icon(Icons.add, size: 32,),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 80,
                      height: 80,
                      child: ClipRRect(
                          borderRadius: CustomTheme.regularBorderRadius,
                          child: Hero(
                            tag: 'character' + widget.character.id.toString(),
                              child: Image.network(widget.character.avatar)
                          )
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.character.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(activeClassJob.unlockedState.name),
                      Text("Lvl - " + activeClassJob.level.toString()),
                      Text("Exp - " + activeClassJob.expLevel.toString() + "/" + activeClassJob.expLevelMax.toString())
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      _toggleGears();
                    },
                    icon: _isGearsEnabled() ? const Icon(Icons.shield) : const Icon(Icons.shield_outlined),
                  )
                ],
              ),
            ),
            const Divider(height: 4,),
           /// Display the selected widget
            Expanded(child: _currentDisplayedWidget)
          ],
        ),
      ),
    );
  }

  _showFavoriteDialog(BuildContext context) {
    showDialog(
        context: (context),
        builder: (_) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.favoriteDialogTitle),
          content: Text(AppLocalizations.of(context)!.favoriteDialogContent),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.noButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.yesButton),
              onPressed: () {
                BlocProvider.of<CharacterBloc>(context).add(AddCharacterToFavoriteEvent(character: widget.character));
                BlocProvider.of<CharacterBloc>(context).add(FetchCharacterByIdEvent(id: widget.character.id));
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }

  _showUnfavoriteDialog(BuildContext context) {
    showDialog(
        context: (context),
        builder: (_) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.unfavoriteDialogTitle),
          content: Text(AppLocalizations.of(context)!.unfavoriteDialogContent),
          actions: [
            TextButton(
              child: Text(AppLocalizations.of(context)!.noButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(AppLocalizations.of(context)!.yesButton),
              onPressed: () {
                BlocProvider.of<CharacterBloc>(context).add(RemoveCharacterFromFavoriteEvent(character: widget.character));
                BlocProvider.of<CharacterBloc>(context).add(FetchCharacterByIdEvent(id: widget.character.id));
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }
}
