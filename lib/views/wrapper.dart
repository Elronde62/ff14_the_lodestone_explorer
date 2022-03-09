import 'package:ff14_mobile_app/components/navbar/custom_navbar.dart';
import 'package:ff14_mobile_app/views/home/home_provider.dart';
import 'package:ff14_mobile_app/views/search/search_provider.dart';
import 'package:flutter/material.dart';

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
      _pageController.animateToPage(index, duration: const Duration(microseconds: 450), curve: Curves.easeIn);
    });
  }

  // List of all widgets displayable
  static const pageList = [HomeProvider(), SearchProvider()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("FF14 | The Lodestone Explorer"),
        ),
        bottomNavigationBar: CustomNavbar(
          selectedIndex: _selectedNavigationIndex,
          selectedCallback: _updateSelectedIndex,
        ),
        body: PageView(
          controller: _pageController,
          children: pageList,
          onPageChanged: _updateSelectedIndex,
        )
    );
  }
}
