import 'package:ff14_mobile_app/models/gear.dart';
import 'package:flutter/material.dart';

class GearIcon extends StatelessWidget {
  final Gear gear;
  const GearIcon({Key? key, required this.gear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Image.network(
        gear.item.icon,
        fit: BoxFit.contain,
      ),
    );
  }
}
