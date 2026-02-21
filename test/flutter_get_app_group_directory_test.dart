import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory_platform_interface.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

const _fakeGroupId = 'group.com.example.test';
const _fakePath = '/private/var/mobile/Containers/Shared/AppGroup/fake-uuid';

class MockFlutterGetAppGroupDirectoryPlatform
    with MockPlatformInterfaceMixin
    implements FlutterGetAppGroupDirectoryPlatform {
  @override
  Future<String> get(String identifier) => Future.value(_fakePath);
}

void main() {
  final FlutterGetAppGroupDirectoryPlatform initialPlatform =
      FlutterGetAppGroupDirectoryPlatform.instance;

  test('$MethodChannelFlutterGetAppGroupDirectory is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelFlutterGetAppGroupDirectory>(),
    );
  });

  group('getAppGroupDirectory', () {
    late MockFlutterGetAppGroupDirectoryPlatform fakePlatform;

    setUp(() {
      fakePlatform = MockFlutterGetAppGroupDirectoryPlatform();
      FlutterGetAppGroupDirectoryPlatform.instance = fakePlatform;
    });

    test('returns a Directory with the expected path', () async {
      final directory = await getAppGroupDirectory(_fakeGroupId);

      expect(directory, isA<Directory>());
      expect(directory.path, equals(_fakePath));
    });
  });
}
