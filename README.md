# flutter_get_app_group_directory

A Flutter plugin for iOS and macOS that resolves the shared container directory for an [App Group](https://developer.apple.com/documentation/xcode/configuring-app-groups).

[![Pub](https://img.shields.io/pub/v/flutter_get_app_group_directory.svg)](https://pub.dev/packages/flutter_get_app_group_directory)
![Dart CI](https://github.com/MyLittleSuite/flutter_get_app_group_directory/workflows/Dart%20CI/badge.svg)
[![Star on GitHub](https://img.shields.io/github/stars/MyLittleSuite/flutter_get_app_group_directory.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/MyLittleSuite/flutter_get_app_group_directory)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

---

## Supported Platforms

| Platform | Support |
|----------|---------|
| iOS      | ✅      |
| macOS    | ✅      |

---

## Prerequisites

1. Open your app in Xcode.
2. In **Signing & Capabilities**, add the **App Groups** capability to both your main target and any extension that needs access.
3. Register the group identifier (e.g. `group.com.example.myapp`).

> The same identifier must be added to both the app and extension entitlements.

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_get_app_group_directory: ^0.0.1
```

---

## Usage

```dart
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory.dart';

Future<void> example() async {
  try {
    final Directory dir = await getAppGroupDirectory(
      'group.com.example.myapp',
    );
    print('Shared container path: ${dir.path}');
  } on PlatformException catch (e) {
    // e.code is one of:
    //   'INVALID_ARGUMENTS' – identifier argument was missing or of the wrong type
    //   'APP_GROUP_NOT_FOUND' – the OS could not resolve a container URL for that identifier
    //   'NULL_RESULT' – the native side returned null unexpectedly
    print('Failed to get app group directory: [${e.code}] ${e.message}');
  }
}
```

---

## API

### `getAppGroupDirectory(String identifier)`

Returns the `Directory` representing the shared container for the App Group identified by `identifier`.

| Parameter    | Type     | Description                              |
|-------------|----------|------------------------------------------|
| `identifier` | `String` | The App Group identifier (e.g. `group.com.example.myapp`) |

**Returns** `Future<Directory>`

**Throws** `PlatformException` with one of the following codes:

| Code                  | Description                                                  |
|-----------------------|--------------------------------------------------------------|
| `INVALID_ARGUMENTS`   | The `identifier` argument is missing or not a `String`.      |
| `APP_GROUP_NOT_FOUND` | The OS could not resolve a container URL for the identifier. |
| `NULL_RESULT`         | The native layer returned `null` unexpectedly.               |

---

## License

MIT — see [LICENSE](LICENSE).
