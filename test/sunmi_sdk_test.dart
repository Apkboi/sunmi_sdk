import 'package:flutter_test/flutter_test.dart';
import 'package:sunmi_sdk/sunmi_sdk.dart';
import 'package:sunmi_sdk/sunmi_sdk_platform_interface.dart';
import 'package:sunmi_sdk/sunmi_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSunmiSdkPlatform
    with MockPlatformInterfaceMixin
    implements SunmiSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SunmiSdkPlatform initialPlatform = SunmiSdkPlatform.instance;

  test('$MethodChannelSunmiSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSunmiSdk>());
  });

  test('getPlatformVersion', () async {
    SunmiSdk sunmiSdkPlugin = SunmiSdk();
    MockSunmiSdkPlatform fakePlatform = MockSunmiSdkPlatform();
    SunmiSdkPlatform.instance = fakePlatform;

    expect(await sunmiSdkPlugin.getPlatformVersion(), '42');
  });
}
