import 'package:ff14_mobile_app/views/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/character_hive.dart';

Future<void> main() async {
  await Hive.initFlutter();
  // Register Adapter
  Hive.registerAdapter(CharacterHiveAdapter());
  await Hive.openBox<CharacterHive>('charactersBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FF14 | The Lodestone Explorer',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.blumineBlue),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blumineBlue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      home: const Wrapper()
    );
  }

}

