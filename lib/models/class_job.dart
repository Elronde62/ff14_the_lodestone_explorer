import 'package:ff14_mobile_app/models/class_character.dart';
import 'package:ff14_mobile_app/models/class_job_unlocked_state.dart';
import 'package:ff14_mobile_app/models/job.dart';

import '../core/model.dart';

/// A ClassJob model that parse data from API
///
/// {@category Models}
class ClassJob extends Model {

  final int expLevel;
  final int expLevelMax;
  final int expLevelTogo;
  final bool isSpecialised;
  final int level;
  final String name;
  final ClassCharacter classCharacter;
  final Job job;
  final ClassJobUnlockedState classJobUnlockedState;

  ClassJob({required this.expLevel, required this.expLevelMax, required this.expLevelTogo, required this.isSpecialised, required this.level, required this.name, required this.classCharacter, required this.job, required this.classJobUnlockedState});

  factory ClassJob.fromJson(Map<String, dynamic> json) {

    ClassJob classJob = ClassJob(
        expLevel: json["ExpLevel"],
        expLevelMax: json["ExpLevelMax"],
        expLevelTogo: json["ExpLevelTogo"],
        isSpecialised: json["IsSpecialised"],
        level: json["Level"],
        name: json["Name"],
        classCharacter: ClassCharacter.fromJson(json["Class"]),
        job: Job.fromJson(json["Job"]),
        classJobUnlockedState: ClassJobUnlockedState.fromJson(json["UnlockedState"])
    );
    return classJob;
  }
  
  /// Return the ClassJob unlocked state
  ClassJobUnlockedState get unlockedState {
    return classJobUnlockedState;
  }
}