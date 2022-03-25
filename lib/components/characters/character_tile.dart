import 'package:ff14_mobile_app/config/custom_theme.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/views/characters/character_provider.dart';
import 'package:flutter/material.dart';

/// A character tile containing its name, server and avatar
///
/// {@category Components}
class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: CustomTheme.regularBorderRadius,
          color: Theme.of(context).colorScheme.secondary
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: CustomTheme.regularBorderRadius,
                    child: Hero(
                      tag: 'character' + character.id.toString(),
                        child: Image.network(character.avatar)
                    )
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(character.name, style: const TextStyle(fontWeight: FontWeight.bold),),
                Text("Server: ${character.server}")
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterProvider(id: character.id)));
              },
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
            )
          ],
        ),
      ),
    );
  }
}
