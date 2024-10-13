import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sunmi_sdk_method_channel.dart';

abstract class SunmiSdkPlatform extends PlatformInterface {
  /// Constructs a SunmiSdkPlatform.
  SunmiSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static SunmiSdkPlatform _instance = MethodChannelSunmiSdk();

  /// The default instance of [SunmiSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelSunmiSdk].
  static SunmiSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SunmiSdkPlatform] when
  /// they register themselves.
  static set instance(SunmiSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
