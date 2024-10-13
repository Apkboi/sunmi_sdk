
import 'sunmi_sdk_platform_interface.dart';

class SunmiSdk {
  Future<String?> getPlatformVersion() {
    return SunmiSdkPlatform.instance.getPlatformVersion();
  }
}
