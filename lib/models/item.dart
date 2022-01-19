import 'package:ff14_mobile_app/config/ff14.dart';
import 'package:ff14_mobile_app/core/model.dart';
import 'package:ff14_mobile_app/models/class_job_category.dart';
import 'package:ff14_mobile_app/models/item_ui_category.dart';

class Item extends Model {

  final ClassJobCategory classJobCategory;
  final int id;
  final String name;
  final String icon;
  final ItemUiCategory itemUiCategory;
  final int levelEquip;
  final int levelItem;
  final int rarity;
  
  Item({required this.classJobCategory, required this.id, required this.name, required this.icon, required this.itemUiCategory, required this.levelEquip, required this.levelItem, required this.rarity});
  
  Item.fromJson(Map<String, dynamic> json):
      classJobCategory = ClassJobCategory.fromJson(json["ClassJobCategory"]),
      id = json["ID"],
      name = json["Name"],
      icon = FF14.api + json["Icon"],
      itemUiCategory = ItemUiCategory.fromJson(json["ItemUICategory"]),
      levelEquip = json["LevelEquip"],
      levelItem = json["LevelItem"],
      rarity = json["Rarity"];

}