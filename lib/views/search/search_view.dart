import 'package:ff14_mobile_app/components/characters/character_tile.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/views/characters/character_provider.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {

  final List<Character> characters;
  const SearchView({Key? key, required this.characters}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                for(Character char in characters)
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
