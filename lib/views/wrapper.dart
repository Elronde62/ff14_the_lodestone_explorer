import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ff14_mobile_app/views/home/home_provider.dart';
import 'package:ff14_mobile_app/views/search/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  int _selectedNavigationIndex = 0;
  /// Update the selected navigation index
  _updateSelectedIndex(int index){
    setState(() {
      _selectedNavigationIndex = index;
    });
  }

  // List of all widgets displayable
  static const pageList = [HomeProvider(), SearchProvider()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("FF14 | The Lodestone Explorer"),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedNavigationIndex,
          curve: Curves.easeIn,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.add, size: 30),
              title: Text(AppLocalizations.of(context)!.navbarFavorites),
              activeColor: Theme.of(context).colorScheme.secondary,
              inactiveColor: Theme.of(context).colorScheme.primary
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.list, size: 30),
                title: Text(AppLocalizations.of(context)!.navbarSearch),
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveColor: Theme.of(context).colorScheme.primary
            ),
          ],
          onItemSelected: _updateSelectedIndex,
        ),
        body: pageList[_selectedNavigationIndex]
    );
  }
}
