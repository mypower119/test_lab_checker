import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'test_lab_checker_method_channel.dart';

abstract class TestLabCheckerPlatform extends PlatformInterface {
  /// Constructs a TestLabCheckerPlatform.
  TestLabCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static TestLabCheckerPlatform _instance = MethodChannelTestLabChecker();

  /// The default instance of [TestLabCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelTestLabChecker].
  static TestLabCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TestLabCheckerPlatform] when
  /// they register themselves.
  static set instance(TestLabCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isRunningInTestLab() {
    throw UnimplementedError('isRunningInTestLab() has not been implemented.');
  }
}
