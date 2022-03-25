import 'package:ff14_mobile_app/core/model.dart';

/// A Job model that parse data from API
///
/// {@category Models}
class Job extends Model {

  final String abbreviation;
  final int id;
  final String icon;
  final String name;
  final String url;

  Job({required this.abbreviation, required this.id, required this.icon, required this.name, required this.url});

  Job.fromJson(Map<String, dynamic> json):
    abbreviation = json["Abbreviation"],
    id = json["ID"],
    icon = json["Icon"],
    name = json["Name"],
    url = json["Url"];
}