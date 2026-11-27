import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_get_app_group_directory_example/main.dart';

void main() {
  testWidgets('Shows the initial status and the resolve button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text('Tap the button to resolve the App Group directory.'),
      findsOneWidget,
    );
    expect(find.text('Resolve App Group Directory'), findsOneWidget);
  });
}
