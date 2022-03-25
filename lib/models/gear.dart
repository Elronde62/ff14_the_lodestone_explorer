import 'package:ff14_mobile_app/core/model.dart';
import 'package:ff14_mobile_app/models/class_job_category.dart';
import 'package:ff14_mobile_app/models/item_ui_category.dart';

import 'item.dart';
import 'mirage.dart';

/// A Gear model that parse data from API
///
/// {@category Models}
class Gear extends Model {

  final Item item;

  Gear({required this.item, Mirage? mirage});

  factory Gear.fromJson(Map<String, dynamic>? json) {
    Gear dummyGear =  Gear(item: Item(id: -1, name: "Empty", classJobCategory: ClassJobCategory(id: -1, name: "None"), icon: "empty", itemUiCategory: ItemUiCategory(id: -1, name: "Empty"), levelEquip: -1, levelItem: -1, rarity: -1));

    if(json == null || json["Item"] == null) {
      return dummyGear;
    }

    if(json["Mirage"] != null) {
      return  Gear(item: Item.fromJson(json["Item"]), mirage: Mirage.fromJson(json["Mirage"]));
    }
    return Gear(item: Item.fromJson(json["Item"]));
  }


}