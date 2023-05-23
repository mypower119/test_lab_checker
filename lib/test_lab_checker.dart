
import 'test_lab_checker_platform_interface.dart';

class TestLabChecker {
  Future<String?> getPlatformVersion() {
    return TestLabCheckerPlatform.instance.getPlatformVersion();
  }
  Future<bool> isRunningInTestLab() {
    return TestLabCheckerPlatform.instance.isRunningInTestLab();
  }
}
