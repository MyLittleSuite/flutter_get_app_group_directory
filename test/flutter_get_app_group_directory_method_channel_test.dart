import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MethodChannelFlutterGetAppGroupDirectory platform;
  const channel = MethodChannel('flutter_get_app_group_directory');
  const fakeGroupId = 'group.com.example.test';
  const fakePath = '/private/var/mobile/Containers/Shared/AppGroup/fake-uuid';

  setUp(() {
    platform = MethodChannelFlutterGetAppGroupDirectory();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('get', () {
    test('returns path string on success', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        expect(methodCall.method, 'get');
        expect(methodCall.arguments, {'identifier': fakeGroupId});
        return fakePath;
      });

      final result = await platform.get(fakeGroupId);
      expect(result, equals(fakePath));
    });

    test('throws PlatformException with NULL_RESULT when native returns null',
        () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return null;
      });

      expect(
        () => platform.get(fakeGroupId),
        throwsA(
          isA<PlatformException>().having(
            (e) => e.code,
            'code',
            'NULL_RESULT',
          ),
        ),
      );
    });

    test('propagates PlatformException thrown by native', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        throw PlatformException(
          code: 'APP_GROUP_NOT_FOUND',
          message: 'Could not find container URL for group ID: $fakeGroupId',
        );
      });

      expect(
        () => platform.get(fakeGroupId),
        throwsA(
          isA<PlatformException>().having(
            (e) => e.code,
            'code',
            'APP_GROUP_NOT_FOUND',
          ),
        ),
      );
    });
  });
}
