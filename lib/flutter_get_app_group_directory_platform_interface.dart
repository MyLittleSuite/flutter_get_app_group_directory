import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_get_app_group_directory_method_channel.dart';

abstract class FlutterGetAppGroupDirectoryPlatform extends PlatformInterface {
  /// Constructs a FlutterGetAppGroupDirectoryPlatform.
  FlutterGetAppGroupDirectoryPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterGetAppGroupDirectoryPlatform _instance =
      MethodChannelFlutterGetAppGroupDirectory();

  /// The default instance of [FlutterGetAppGroupDirectoryPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterGetAppGroupDirectory].
  static FlutterGetAppGroupDirectoryPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterGetAppGroupDirectoryPlatform]
  /// when they register themselves.
  static set instance(FlutterGetAppGroupDirectoryPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the path of the shared container directory for the App Group
  /// identified by [identifier].
  ///
  /// Throws a [PlatformException] if [identifier] is invalid or the OS cannot
  /// resolve the container URL.
  Future<String> get(String identifier) {
    throw UnimplementedError('get() has not been implemented.');
  }
}
