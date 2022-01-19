import 'package:ff14_mobile_app/core/model.dart';

class ClassJobCategory extends Model {

  final int id;
  final String name;

  ClassJobCategory({required this.id, required this.name});

  ClassJobCategory.fromJson(Map<String, dynamic> json):
        id = json["ID"],
        name = json["Name"];
}