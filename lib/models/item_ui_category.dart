import 'package:ff14_mobile_app/core/model.dart';

class ItemUiCategory extends Model {

  final int id;
  final String name;

  ItemUiCategory({required this.id, required this.name});

  ItemUiCategory.fromJson(Map<String, dynamic> json):
      id = json["ID"],
      name = json["Name"];
}