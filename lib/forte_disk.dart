import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sunmi_sdk/models/refund_response_model.dart';
import 'package:sunmi_sdk/models/sales_response_model.dart';
import 'package:sunmi_sdk/models/void_response_model.dart';

class SunmiSdk {
  static const platform = MethodChannel('sunmi_sdk_channel');

  // SDK Initialization method
  // Set Application Mode method
  Future<void> setApplicationMode(String apiKey, String mode) async {
    try {
      final result = await platform.invokeMethod('setApplicationMode', {'apiKey': apiKey, 'mode': mode});
      print(result); // Process the result from native Android code
    } on PlatformException catch (e) {
      print("Failed to set application mode: '${e.message}'.");
      throw "ERROR_MESSAGE: ${e.message}\n ERROR CODE ${e.code}.";
    }
  }

  // Print method (Plaintext)
  Future<void> printPlaintext(String text) async {
    try {
      final result = await platform.invokeMethod('printPlaintext', {'text': text});
      print(result); // Handle successful result from native Android code
    } on PlatformException catch (e) {
      print("Failed to print: '${e.message} ${e.code}'.");
      throw "Failed to print: '${e.message}'.";
    }
  }

  // Start Card Payment

  Future<SaleResponseModel> startCardPayment(
    int amount,
    String currencyCode,
    String documentNr, {
     bool skipReceiptPrint =true,
    bool skipCustomerReceiptPrint = true,
  }) async {
    try {
      final result = await platform.invokeMethod('startCardPayment', {
        'amount': amount,
        'currencyCode': currencyCode,
        'documentNr': documentNr,
        'skipReceiptPrint': skipReceiptPrint,
        'skipCustomerReceiptPrint': skipCustomerReceiptPrint,
      });

      final jsonResult = jsonDecode(result) as Map<String, dynamic>;
      return SaleResponseModel.fromJson(jsonResult);
    } on PlatformException catch (e) {
      throw Exception("Card payment failed: ${e.message}");
    }
  }

  // Refund Payment Method
  Future<RefundResponse> refundPayment({
    required int refundAmount,
    required String currencyCode,
    required String documentNr,
    required String stan,
    required DateTime transactionDate,
    required String rrn,
    required bool skipReceiptPrint,
    bool skipCustomerReceiptPrint = false,
  }) async {
    try {

      final result = await platform.invokeMethod('refundTransaction', {
        'refundAmount': refundAmount,
        'currencyCode': currencyCode,
        'documentNr': documentNr,
        'stan': stan,
        'transactionDate': transactionDate.toIso8601String(),
        'rrn': rrn,
        'skipReceiptPrint': skipReceiptPrint,
        'skipCustomerReceiptPrint': skipCustomerReceiptPrint,
      });

      final jsonResult = jsonDecode(result) as Map<String, dynamic>;
      return RefundResponse.fromJson(jsonResult);
    } on PlatformException catch (e) {
      throw Exception("Refund failed: ${e.message}");
    }
  }

  Future<VoidResponse> voidTransaction({
    required String operationId,
    required int partialVoidAmount,
    required bool skipReceiptPrint,
    bool skipCustomerReceiptPrint = false,
  }) async {
    try {
      final result = await platform.invokeMethod('voidTransaction', {
        'operationId': operationId,
        'partialVoidAmount': partialVoidAmount,
        'skipReceiptPrint': skipReceiptPrint,
        'skipCustomerReceiptPrint': skipCustomerReceiptPrint,
      });

      final jsonResult = jsonDecode(result) as Map<String, dynamic>;
      return VoidResponse.fromJson(jsonResult);
    } on PlatformException catch (e) {
      throw Exception("Void transaction failed: ${e.message}");
    }
  }

  Future<void> closeDocument({
    required String documentNr,
    required List<String> operationIdList,
    required bool skipReceiptPrint,
    bool skipCustomerReceiptPrint = false,
  }) async {
    try {
      final result = await platform.invokeMethod('closeDocument', {
        'documentNr': documentNr,
        'operationIdList': operationIdList,
        'skipReceiptPrint': skipReceiptPrint,
        'skipCustomerReceiptPrint': skipCustomerReceiptPrint,
      });
      print(result); // Handle successful result from native Android code
    } on PlatformException catch (e) {
      print("Close document failed: '${e.message} ${e.code}'.");
      throw "Close document failed: '${e.message}'.";
    }
  }
}
