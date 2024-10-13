import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sunmi_sdk_platform_interface.dart';

/// An implementation of [SunmiSdkPlatform] that uses method channels.
class MethodChannelSunmiSdk extends SunmiSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sunmi_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
