import 'package:ff14_mobile_app/components/items/gear_icon.dart';
import 'package:ff14_mobile_app/models/character_gears.dart';
import 'package:ff14_mobile_app/models/gear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CharacterGearsList extends StatelessWidget {
  final CharacterGears characterGears;
  const CharacterGearsList({Key? key, required this.characterGears}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(AppLocalizations.of(context)!.characterGears, style: Theme.of(context).textTheme.headline6,)
        ),
        Expanded(
          child: ListView(
            children: [
              _rowGearIcon(context, characterGears.mainHand, characterGears.hands),
              _rowGearIcon(context, characterGears.head, characterGears.earrings),
              _rowGearIcon(context, characterGears.body, characterGears.ring1),
              _rowGearIcon(context, characterGears.bracelets, characterGears.necklace),
              _rowGearIcon(context, characterGears.legs, characterGears.ring2),
              _rowGearIcon(context, characterGears.feet, characterGears.soulCrystal),
            ],
          ),
        ),
      ],
    );
  }

  _rowGearIcon(BuildContext context, Gear gear1, Gear gear2) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _showGearDetail(context, gear1),
              child: GearIcon(gear: gear1)),
            GestureDetector(
              onTap: () => _showGearDetail(context, gear2),
                child: GearIcon(gear: gear2)
            )
          ]
      ),
    );
  }

  _showGearDetail(BuildContext context, Gear gear) {
    showDialog(
        context: (context),
        builder: (_) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.details),
          content: SizedBox(
            height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                            child: GearIcon(gear: gear)
                        ),
                        Flexible(child: Text(gear.item.name)),
                      ],
                    ),
                  ),
                  Text(gear.item.itemUiCategory.name),
                  Text("iLvl - " + gear.item.levelItem.toString()),
                  Text("Rarity - " + gear.item.rarity.toString()),
                  Text("Could be equiped by " + gear.item.classJobCategory.name),
                ],
              )
          ),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }
}
