import 'package:ff14_mobile_app/core/model.dart';
import 'package:ff14_mobile_app/models/character_gears.dart';
import 'package:ff14_mobile_app/models/class_job.dart';

import 'mount.dart';

class Character extends Model {

  int id;
  String name;
  String avatar;
  String server;
  ClassJob? activeClassJob;
  List<ClassJob>? classJobs;
  CharacterGears? characterGears;
  List<Mount>? mounts;

  Character({required this.id, required this.name, required this.avatar, required this.server, this.activeClassJob, this.classJobs, this.characterGears, this.mounts});

  factory Character.fromJson(Map<String, dynamic> json) {
    // Map character data from json
    Map<String, dynamic> characterJson = json;

    // If the character key exist, then set characterJson to it
    if(json.containsKey("Character")) {
      characterJson = json["Character"];
    }

    Character char =  Character(id: characterJson["ID"], name: characterJson["Name"], avatar: characterJson["Avatar"], server: characterJson["Server"]);

    if(characterJson.containsKey("ActiveClassJob")) {
      // Parse every classJobs
      var classJobsMap = characterJson["ClassJobs"];
      List<ClassJob> classJobs = [];

      for(Map<String, dynamic> job in classJobsMap) {
        classJobs.add(ClassJob.fromJson(job));
      }

      char.activeClassJob = ClassJob.fromJson(characterJson["ActiveClassJob"]);

      char.classJobs = classJobs;
    }

    // Handle player gears
    if(characterJson.containsKey("GearSet") && characterJson["GearSet"] != null) {
      char.characterGears = CharacterGears.fromJson(characterJson["GearSet"]["Gear"]);
    }

    // Handle player mounts
    if(json.containsKey("Mounts")) {
      var mountsMap = characterJson["Mounts"];
      List<Mount> mounts = [];

      if(characterJson["Mounts"] != null) {
        for(Map<String, dynamic> mount in mountsMap) {
          mounts.add(Mount.fromJson(mount));
        }

      }
      char.mounts = mounts;
    }

    return char;
  }

}