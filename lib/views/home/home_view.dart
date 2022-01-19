import 'package:ff14_mobile_app/components/characters/character_tile.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/views/characters/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  final List<Character> favoritesCharacters;
  
  const HomeView({Key? key, required this.favoritesCharacters}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.myCharacters, style: Theme.of(context).textTheme.headline5,),
          const Divider(height: 2.5, thickness: 2,),
          Expanded(
            child: ListView(
              children: [
                for(Character char in favoritesCharacters)
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterProvider(id: char.id)));
                      },
                      child: CharacterTile(character: char)
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

}
