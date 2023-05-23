import 'package:flutter_test/flutter_test.dart';
import 'package:test_lab_checker/test_lab_checker.dart';
import 'package:test_lab_checker/test_lab_checker_platform_interface.dart';
import 'package:test_lab_checker/test_lab_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTestLabCheckerPlatform
    with MockPlatformInterfaceMixin
    implements TestLabCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> isRunningInTestLab() => Future.value(false);
}

void main() {
  final TestLabCheckerPlatform initialPlatform = TestLabCheckerPlatform.instance;

  test('$MethodChannelTestLabChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTestLabChecker>());
  });

  test('getPlatformVersion', () async {
    TestLabChecker testLabCheckerPlugin = TestLabChecker();
    MockTestLabCheckerPlatform fakePlatform = MockTestLabCheckerPlatform();
    TestLabCheckerPlatform.instance = fakePlatform;

    expect(await testLabCheckerPlugin.getPlatformVersion(), '42');
  });
}
