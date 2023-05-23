import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_lab_checker_platform_interface.dart';

/// An implementation of [TestLabCheckerPlatform] that uses method channels.
class MethodChannelTestLabChecker extends TestLabCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_lab_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> isRunningInTestLab() async {
    if(Platform.isAndroid) {
      final isRunningInTestLab = await methodChannel.invokeMethod<String>('isRunningInTestLab');
      return 'true' == isRunningInTestLab;
    }
    return false;
  }
}
