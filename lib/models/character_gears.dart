import 'package:ff14_mobile_app/core/model.dart';

import 'gear.dart';

/// A gears model that parse data from API
///
/// {@category Models}
class CharacterGears extends Model {

  final Gear body;
  final Gear bracelets;
  final Gear earrings;
  final Gear feet;
  final Gear hands;
  final Gear head;
  final Gear legs;
  final Gear mainHand;
  final Gear necklace;
  final Gear ring1;
  final Gear ring2;
  final Gear soulCrystal;

  CharacterGears({required this.body, required this.bracelets, required this.earrings, required this.feet, required this.hands, required this.head, required this.legs, required this.mainHand, required this.necklace, required this.ring1, required this.ring2, required this.soulCrystal});

  CharacterGears.fromJson(Map<String, dynamic> json):
      body = Gear.fromJson(json["Body"]),
      bracelets = Gear.fromJson(json["Bracelets"]),
      earrings = Gear.fromJson(json["Earrings"]),
      feet = Gear.fromJson(json["Feet"]),
      hands = Gear.fromJson(json["Hands"]),
      head = Gear.fromJson(json["Head"]),
      legs = Gear.fromJson(json["Legs"]),
      mainHand = Gear.fromJson(json["MainHand"]),
      necklace = Gear.fromJson(json["Necklace"]),
      ring1 = Gear.fromJson(json["Ring1"]),
      ring2 = Gear.fromJson(json["Ring2"]),
      soulCrystal = Gear.fromJson(json["SoulCrystal"]);

}