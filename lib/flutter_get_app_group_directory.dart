import 'dart:io';

import 'flutter_get_app_group_directory_platform_interface.dart';

/// Returns the [Directory] for the App Group identified by [identifier].
///
/// Throws a [PlatformException] if the group identifier is invalid or
/// the container URL cannot be resolved by the OS.
Future<Directory> getAppGroupDirectory(String identifier) async {
  final path = await FlutterGetAppGroupDirectoryPlatform.instance.get(
    identifier,
  );
  return Directory(path);
}
