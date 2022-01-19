import 'package:ff14_mobile_app/config/ff14.dart';
import 'package:ff14_mobile_app/models/character.dart';
import 'package:ff14_mobile_app/models/class_job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClassJobsList extends StatelessWidget {
  final Character character;

  const ClassJobsList({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ClassJob> availableClassJob = character.classJobs!.where((element) => element.level > 0).toList();

    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Text(AppLocalizations.of(context)!.jobList, style: Theme.of(context).textTheme.headline6,)
        ),
        Expanded(
          child: ListView(
            children: [
              for(ClassJob job in availableClassJob)
                _buildJobTile(job)
            ],
          ),
        ),
      ],
    );
  }

  /// Build the job tile
  _buildJobTile(ClassJob classJob) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          // Check if the user is over lvl 30
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    margin: const EdgeInsets.only(right: 8),
                    child: classJob.level >= 30 ? Image.network(FF14.api + classJob.job.icon) : Image.network(FF14.api + classJob.classCharacter.icon),
                  ),
                  Text(classJob.unlockedState.name + " - " + (classJob.level >= 30 ? classJob.job.abbreviation : classJob.classCharacter.abbreviation), style: const TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              Text("Lvl - " + classJob.level.toString()),
              Text("Exp - " + classJob.expLevel.toString() + "/" + classJob.expLevelMax.toString())
            ],
          ),
        ],
      ),
    );
  }

}
