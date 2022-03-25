import 'package:ff14_mobile_app/core/model.dart';

/// A Character Class model that parse data from API
///
/// {@category Models}
class ClassCharacter extends Model {

  final String abbreviation;
  final int id;
  final String icon;
  final String name;
  final String url;

  ClassCharacter({required this.abbreviation, required this.id, required this.icon, required this.name, required this.url});

  ClassCharacter.fromJson(Map<String, dynamic> json):
        abbreviation = json["Abbreviation"],
        id = json["ID"],
        icon = json["Icon"],
        name = json["Name"],
        url = json["Url"];
}