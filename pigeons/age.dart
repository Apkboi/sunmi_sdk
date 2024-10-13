import 'package:pigeon/pigeon.dart';
@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/auto_pigeon/age_sdk.dart',
    javaOptions: JavaOptions(
      className: 'AgeSdk',
      package: 'com.palomapos.sunmi_sdk',
    ),
    objcOptions: ObjcOptions(prefix: ''),
    objcHeaderOut: 'ios/Runner/Pigeon/AgeSdk.h',
    objcSourceOut: 'ios/Runner/Pigeon/AgeSdk.m',
    kotlinOut: './android/src/main/java/com/palomapos/age_sdk/pigeon/AgeSdk.kt'
    // experimental_cppHeaderOut: 'windows/runner/pigeon/POSLinkTransaction.h',
    // experimental_cppSourceOut: 'windows/runner/pigeon/POSLinkTransaction.cpp',
    // experimental_cppOptions: CppOptions(header: '', namespace: 'POSLinkTransaction'),
  ),
)

@HostApi()
abstract class AgeSdkApi {
  @async
  int? getAge();

}
