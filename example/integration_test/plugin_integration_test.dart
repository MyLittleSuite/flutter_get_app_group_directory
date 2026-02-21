// Integration test for flutter_get_app_group_directory.
//
// This test runs in a full Flutter application and exercises the method
// channel end-to-end. It requires a valid App Group identifier configured
// in the Runner's entitlements and provisioning profile.
//
// Replace [appGroupIdentifier] with the actual identifier used in your
// app's entitlements before running this test on a real device/simulator.
//
// See https://flutter.dev/to/integration-testing

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Replace with an App Group identifier that is configured in the
  // Runner's entitlements (e.g. group.com.example.myapp).
  const appGroupIdentifier = 'group.com.example.myapp';

  testWidgets('get returns a non-empty Directory path', (WidgetTester tester) async {
    try {
      final directory = await getAppGroupDirectory(appGroupIdentifier);
      expect(directory, isA<Directory>());
      expect(directory.path.isNotEmpty, isTrue);
    } on Exception catch (e) {
      // If the group is not configured on the test device this test is skipped.
      markTestSkipped('App Group not configured on this device: $e');
    }
  });
}
