import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_get_app_group_directory_platform_interface.dart';

/// An implementation of [FlutterGetAppGroupDirectoryPlatform] that uses method channels.
class MethodChannelFlutterGetAppGroupDirectory
    extends FlutterGetAppGroupDirectoryPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_get_app_group_directory');

  @override
  Future<String> get(String identifier) async {
    final path = await methodChannel.invokeMethod<String>(
      'get',
      {'identifier': identifier},
    );
    if (path == null) {
      throw PlatformException(
        code: 'NULL_RESULT',
        message: 'The native platform returned a null path for identifier: $identifier',
      );
    }
    return path;
  }
}
