import 'package:ff14_mobile_app/components/items/gear_icon.dart';
import 'package:ff14_mobile_app/models/gear.dart';
import 'package:flutter/material.dart';

/// A Gear tile containing its name and its icon
///
/// {@category Components}
class GearTile extends StatelessWidget {
  final Gear gear;
  const GearTile({Key? key, required this.gear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GearIcon(gear: gear),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(gear.item.name),
            Text("iLvl - " + gear.item.levelItem.toString())
          ],
        )
      ],
    );
  }
}
