import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


import 'package:ff14_mobile_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Verify if the character search bar is accessible',   (WidgetTester tester) async {
          // Loading app
          await app.main();
          await tester.pumpAndSettle();

          // Finds the floating action button to tap on.
          final Finder navBarSearch = find.byIcon(Icons.list);

          // Emulate a tap on the floating action button.
          await tester.tap(navBarSearch);

          // Trigger a frame.
          await tester.pumpAndSettle();

          // Find the searchbar
          final Finder searchBar = find.byType(TextFormField);

          await tester.tap(searchBar);
          await tester.enterText(searchBar, "Axiton");
          await tester.testTextInput.receiveAction(TextInputAction.done);

          expect(find.text("Axiton"), findsOneWidget);
        });
  });
}