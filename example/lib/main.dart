import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_get_app_group_directory/flutter_get_app_group_directory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Replace with your actual App Group identifier
  static const _groupIdentifier = 'group.com.example.myapp';

  String _status = 'Tap the button to resolve the App Group directory.';

  Future<void> _resolveDirectory() async {
    String status;
    try {
      final Directory dir =
          await getAppGroupDirectory(_groupIdentifier);
      status = 'App Group directory:\n${dir.path}';
    } on PlatformException catch (e) {
      status = 'Error [${e.code}]: ${e.message}';
    } catch (e) {
      status = 'Unexpected error: $e';
    }

    if (!mounted) return;
    setState(() => _status = status);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('App Group Directory Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(_status, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _resolveDirectory,
                child: const Text('Resolve App Group Directory'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
