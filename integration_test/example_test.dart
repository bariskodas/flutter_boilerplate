import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_boilerplate/flavors/main_dev.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('counter 0 to 21', (widgetTester) async {
    //* setup
    app.main();
    await widgetTester.pumpAndSettle();

//* do
    final Finder addButton = find.byIcon(Icons.add);

    for (var i = 0; i < 21; i++) {
      await widgetTester.tap(addButton);
      await Future.delayed(
          i % 2 == 0 ? const Duration(seconds: 1) : const Duration(seconds: 3));
    }

//* test
    expect(find.text('21'), findsOneWidget);
  });
}
