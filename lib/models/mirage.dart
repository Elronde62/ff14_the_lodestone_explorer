import 'package:ff14_mobile_app/core/model.dart';

/// A Mirage model that parses data from API
///
/// {@category Models}
class Mirage extends Model {

  final int id;
  final String icon;
  final String name;

  Mirage({required this.id, required this.icon, required this.name});

  Mirage.fromJson(Map<String, dynamic> json):
      id = json["ID"],
      icon = json["Icon"],
      name = json["Name"];
}