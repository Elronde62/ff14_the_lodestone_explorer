import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomNavbar extends StatelessWidget {
  final Function(int) selectedCallback;
  final int selectedIndex;

  const CustomNavbar({Key? key, required this.selectedIndex, required this.selectedCallback }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: selectedIndex,
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
      onItemSelected: selectedCallback,
    );
  }
}
