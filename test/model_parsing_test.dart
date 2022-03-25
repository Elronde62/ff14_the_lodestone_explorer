import 'package:ff14_mobile_app/models/class_character.dart';
import 'package:ff14_mobile_app/models/class_job_category.dart';
import 'package:ff14_mobile_app/models/class_job_unlocked_state.dart';
import 'package:ff14_mobile_app/models/item_ui_category.dart';
import 'package:ff14_mobile_app/models/job.dart';
import 'package:ff14_mobile_app/models/mirage.dart';
import 'package:ff14_mobile_app/models/mount.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Test if models are correctly parsed from a json', () {

    test('test if mount is correctly parsed', () {

      // False JSON response
      var jsonResponse = {
        "Name": "Super Mouton",
        'Icon': "A super link to an icon"
      };

      // Parse the json
      Mount parsedMount = Mount.fromJson(jsonResponse);

      // Correct Mount model
      Mount correctMount = Mount(name: "Super Mouton", icon: "A super link to an icon");

      // Check if the Mount is correctly parsed
      expect(parsedMount.name, correctMount.name);
      expect(parsedMount.icon, correctMount.icon);
    });

    test('test if mirage is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "ID": 5,
        "Icon": "A super icon",
        "Name": "Magnifique Mirage"
      };

      // Parse the json
      Mirage parsedMirage = Mirage.fromJson(jsonResponse);

      //Correct Mirage model
      Mirage correctMirage = Mirage(id: 5, name: "Magnifique Mirage", icon: "A super icon");

      // Check if the Mirage is correctly parsed
      expect(parsedMirage.id, correctMirage.id);
      expect(parsedMirage.name, correctMirage.name);
      expect(parsedMirage.icon, correctMirage.icon);

    });

    test('test if job is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "Abbreviation": "JDR",
        "ID": 5,
        "Icon": "A super icon",
        "Name": "Un bon job",
        "Url": "link to an url"
      };

      // Parse the json
      Job parsedJob = Job.fromJson(jsonResponse);

      // Correct Job Model
      Job correctJob = Job(abbreviation: "JDR", id: 5, icon: "A super icon", name: "Un bon job", url: "link to an url");

      // Check if the job is correctly parsed
      expect(parsedJob.abbreviation, correctJob.abbreviation);
      expect(parsedJob.id, correctJob.id);
      expect(parsedJob.icon, correctJob.icon);
      expect(parsedJob.name, correctJob.name);
      expect(parsedJob.url, correctJob.url);

    });

    test('test if item ui category is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "ID": 5,
        "Name": "A super UI",
      };

      // Parse the json
      ItemUiCategory parsedItemUiCategory = ItemUiCategory.fromJson(jsonResponse);

      // Correct ItemUiCategory Model
      ItemUiCategory correctItemUiCategory = ItemUiCategory(id: 5,  name: "A super UI");

      // Check if the ItemUiCategory is correctly parsed
      expect(parsedItemUiCategory.id, correctItemUiCategory.id);
      expect(parsedItemUiCategory.name, correctItemUiCategory.name);
    });

    test('test if class job category is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "ID": 5,
        "Name": "A class job category",
      };

      // Parse the json
      ClassJobCategory parsedClassJobCategory = ClassJobCategory.fromJson(jsonResponse);

      // Correct ClassJobCategory
      ClassJobCategory correctClassJobCategory = ClassJobCategory(id: 5, name: "A class job category");

      expect(parsedClassJobCategory.id, correctClassJobCategory.id);
      expect(parsedClassJobCategory.name, correctClassJobCategory.name);
    });

    test('test if class job unlocked state is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "ID": 2,
        "Name": "Locked"
      };

      // Parsed class job unlocked state
      ClassJobUnlockedState parsedClassJobUnlockedState = ClassJobUnlockedState.fromJson(jsonResponse);

      // Correct classJobUnlockedState
      ClassJobUnlockedState correctClassJobUnlockedState = ClassJobUnlockedState(id: 2, name: "Locked");

      expect(parsedClassJobUnlockedState.id, correctClassJobUnlockedState.id);
      expect(parsedClassJobUnlockedState.name, correctClassJobUnlockedState.name);
    });

    test('test if class job unlocked state is correctly parsed when ID null', () {

      // False JSON response
      var jsonResponse = {
        "Name": "Locked"
      };

      // Parsed class job unlocked state
      ClassJobUnlockedState parsedClassJobUnlockedState = ClassJobUnlockedState.fromJson(jsonResponse);

      // Correct classJobUnlockedState
      ClassJobUnlockedState correctClassJobUnlockedState = ClassJobUnlockedState(id: -1, name: "Locked");

      expect(parsedClassJobUnlockedState.id, correctClassJobUnlockedState.id);
      expect(parsedClassJobUnlockedState.name, correctClassJobUnlockedState.name);
    });

    test('test if class  character is correctly parsed from a json', () {

      // False JSON response
      var jsonResponse = {
        "Abbreviation": "JDR",
        "ID": 5,
        "Icon": "A super icon",
        "Name": "Une bonne classe",
        "Url": "link to an url"
      };

      // Parse the json
      ClassCharacter parsedClassCharacter = ClassCharacter.fromJson(jsonResponse);

      // Correct Job Model
      ClassCharacter correctClassCharacter = ClassCharacter(abbreviation: "JDR", id: 5, icon: "A super icon", name: "Une bonne classe", url: "link to an url");

      // Check if the job is correctly parsed
      expect(parsedClassCharacter.abbreviation, correctClassCharacter.abbreviation);
      expect(parsedClassCharacter.id, correctClassCharacter.id);
      expect(parsedClassCharacter.icon, correctClassCharacter.icon);
      expect(parsedClassCharacter.name, correctClassCharacter.name);
      expect(parsedClassCharacter.url, correctClassCharacter.url);

    });

  });
}