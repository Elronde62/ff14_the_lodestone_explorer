import 'package:ff14_mobile_app/core/model.dart';

/// A Mount model that parses data from API
///
/// {@category Models}
class Mount extends Model {

  final String name;
  final String icon;

  Mount({required this.name, required this.icon});

  Mount.fromJson(Map<String, dynamic> json):
      name = json["Name"],
      icon = json["Icon"];

}