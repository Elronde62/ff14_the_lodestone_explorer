import 'package:ff14_mobile_app/core/model.dart';

class ClassJobUnlockedState extends Model {

  final int id;
  final String name;

  ClassJobUnlockedState({required this.id, required this.name});

  factory ClassJobUnlockedState.fromJson(Map<String, dynamic> json) {
    if(json["ID"] == null) {
      return ClassJobUnlockedState(id: -1, name: json["Name"]);
    }
    return ClassJobUnlockedState(id: json["ID"], name: json["Name"]);
  }


}