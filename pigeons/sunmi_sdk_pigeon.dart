import 'package:pigeon/pigeon.dart';
@ConfigurePigeon(
  PigeonOptions(
      dartOut: 'lib/auto_pigeon/sunmi_sdk.dart',
      javaOptions: JavaOptions(
        className: 'SunmiSdk',
        package: 'com.palomapos.sunmi_sdk',
      ),
      objcOptions: ObjcOptions(prefix: ''),
      objcHeaderOut: 'ios/Runner/Pigeon/SunmiSdk.h',
      objcSourceOut: 'ios/Runner/Pigeon/SunmiSdk.m',
      kotlinOut: './android/src/main/kotlin/com/palomapos/sunmi_sdk/pigeon/SunmiSdk.kt'
    // experimental_cppHeaderOut: 'windows/runner/pigeon/POSLinkTransaction.h',
    // experimental_cppSourceOut: 'windows/runner/pigeon/POSLinkTransaction.cpp',
    // experimental_cppOptions: CppOptions(header: '', namespace: 'POSLinkTransaction'),
  ),
)

class SaleRequest {
  int? amount;
  String? currencyCode;



  String? documentNr;
}

class SaleResponse {
  String? status;



  String? message;
// Add other relevant fields
}

class RefundRequest {
   int? refundAmount;
   String? currencyCode;



   String? documentNr;
   String? stan;
   String? transactionDate;  // Use String or define a custom date-time format
   String? rrn;
   bool? skipReceiptPrint;
   bool? skipCustomerReceiptPrint;
}

class VoidRequest {
  String? operationId;
  int? partialVoidAmount;
  bool? skipReceiptPrint;
  bool? skipCustomerReceiptPrint;
}

class CloseDocumentRequest {
  String? documentNr;
  List<String>? operationIdList;
  bool? skipReceiptPrint;
  bool? skipCustomerReceiptPrint;
}

class RefundResponse {
  String? operationId;
  String? cryptogram;
  String? documentNr;
  int? amountAuthorized;
  int? amountAdditional;
  String? authCode;
  String? rrn;
  String? stan;
  String? cardType;
  String? state;
  String? receiptText;
  String? actionCode;
}
class VoidResponse {
  String? operationId;
  String? cryptogram;
  String? documentNr;
  int? amountAuthorized;
  int? amountAdditional;
  String? authCode;
  String? rrn;
  String? stan;
  String? cardType;
  String? state;
  String? receiptText;
}

@HostApi()
abstract class SunmiSdkApi {
  RefundResponse initiateRefund(
      String documentNr,
      int refundAmount,
      String stan,
      String rrn,
      String currencyCode,
      bool skipReceiptPrint,
      bool skipCustomerReceiptPrint,
      );


  VoidResponse initiateVoid(
      String operationId,
      int partialVoidAmount,
      bool skipReceiptPrint,
      bool skipCustomerReceiptPrint,
      );

  void closeDocument(
      String documentNr,
      List<String> operationIdList,
      bool skipReceiptPrint,
      bool skipCustomerReceiptPrint,
      );

  void printPlaintext(String text);

  void setApplicationMode(String apiKey, String mode);

  SaleResponse startCardPayment(SaleRequest request);

  void onSaleCompleted(SaleResponse response);
  void onVoidCompleted(VoidResponse response);
  void onRefundCompleted(RefundResponse response);

}



































