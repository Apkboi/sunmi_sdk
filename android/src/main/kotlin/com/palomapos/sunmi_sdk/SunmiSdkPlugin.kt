package com.palomapos.sunmi_sdk
import RefundResponse
import SaleRequest
import SaleResponse
import SunmiSdkApi
import VoidResponse
import android.app.Activity
import android.content.Intent
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat.startActivityForResult
import eu.ashburn.smartpos.api.EFTRequestCode
import eu.ashburn.smartpos.api.EFTResponseFactory
import eu.ashburn.smartpos.api.Response
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import org.json.JSONArray
import org.json.JSONObject
import java.util.Date

/** SunmiSdkPlugin */
class SunmiSdkPlugin : FlutterPlugin, PluginRegistry.ActivityResultListener, MethodCallHandler {

    // The MethodChannel that will communicate between Flutter and native Android
    private lateinit var channel: MethodChannel

    // Store the result to respond to method calls asynchronously
    private var pendingResult: Result? = null

    private lateinit var paymentSDKHandler: SunmiSdkHandler
    private var activity: Activity? = null // Store the activity reference

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sunmi_sdk_channel")
        channel.setMethodCallHandler(this) // Register this class as the handler
        paymentSDKHandler = SunmiSdkHandler(flutterPluginBinding.applicationContext)


    }

    fun setActivity(activity: Activity) {
        this.activity = activity
    }


    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

        channel.setMethodCallHandler(null)
    }


    override fun onMethodCall(call: MethodCall, result: Result) {
        pendingResult = result // Store the result to handle asynchronously

        when (call.method) {
            "setApplicationMode" -> {
                val apiKey = call.argument<String>("apiKey")!!
                val mode = call.argument<String>("mode")!!
                val intent = paymentSDKHandler.setApplicationMode(apiKey, mode)
                pendingResult = result
                activity?.let { startActivityForResult(it, intent.intent(), intent.requestCode(), null) }
            }

            "printPlaintext" -> {
                val text = call.argument<String>("text")!!
                val intent = paymentSDKHandler.printPlaintext(text)
                intent.intent().type = "application/octet-stream"
                pendingResult = result
                activity?.let { startActivityForResult(it, intent.intent(), intent.requestCode(), null) }

            }

            "startCardPayment" -> {
                val amount = call.argument<Long>("amount")!!
                val currencyCode = call.argument<String>("currencyCode")!!
                val documentNr = call.argument<String>("documentNr")!!
                val intent = paymentSDKHandler.startCardPayment(amount, currencyCode, documentNr)
                pendingResult = result
                activity?.let { startActivityForResult(it, intent.intent(), intent.requestCode(), null) }

                //Simulation
//              initiateCardPayment(amount, currencyCode, documentNr)
            }

            "voidTransaction" -> {
                val operationId = call.argument<String>("operationId")!!
                val partialVoidAmount = call.argument<Long>("partialVoidAmount")!!
                val skipReceiptPrint = call.argument<Boolean>("skipReceiptPrint")!!
                val skipCustomerReceiptPrint = call.argument<Boolean>("skipCustomerReceiptPrint")!!

                val voidRequest = paymentSDKHandler.initiateVoid(
                    operationId = operationId,
                    skipReceiptPrint = skipReceiptPrint,
                    skipCustomerReceiptPrint = skipCustomerReceiptPrint,
                    partialVoidAmount = 115L
                )
                pendingResult = result
                if (voidRequest != null) {
                    activity?.let { startActivityForResult(it, voidRequest.intent(), voidRequest.requestCode(), null) }

                }

            }

            "refundTransaction" -> {
                val documentNr = call.argument<String>("documentNr")!!
                val refundAmount = call.argument<Long>("refundAmount")!!
                val stan = call.argument<String>("stan")!!
                val rrn = call.argument<String>("rrn")!!
                val date = call.argument<Date>("date")!!
                val currencyCode = call.argument<String>("currencyCode")!!
                val skipReceiptPrint = call.argument<Boolean>("skipReceiptPrint")!!
                val skipCustomerReceiptPrint = call.argument<Boolean>("skipCustomerReceiptPrint")!!


                val refundRequest = paymentSDKHandler.initiateRefund(
                    refundAmount = refundAmount,              // Refund amount in minor units (e.g., 1000 = $10.00)
                    currencyCode = currencyCode,              // Currency code
                    documentNr = documentNr,          // Unique document number
                    stan = stan,                   // STAN from original transaction
                    date = Date(),                     // Date of original transaction
                    rrn = rrn,                 // RRN from original transaction
                    skipReceiptPrint = skipReceiptPrint,           // Skip printing the merchant receipt
                    skipCustomerReceiptPrint = skipCustomerReceiptPrint   // Do not skip printing customer receipt
                )

                // Call your refund initiation logic
//                initiateRefund(documentNr!!, refundAmount!!, stan!!, rrn!!, currencyCode!!, false, false)
                pendingResult = result
                activity?.let { startActivityForResult(it, refundRequest.intent(), refundRequest.requestCode(), null) }


            }

            else -> {
                result.notImplemented() // Return a "not implemented" error for unknown method calls
            }
        }
    }

    // Handle responses from activities (e.g., payments or voids)
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        when (EFTRequestCode.get(requestCode)) {
            EFTRequestCode.SALE -> handleSaleResponse(resultCode, data)
            EFTRequestCode.VOID -> handleVoidResponse(resultCode, data)
            EFTRequestCode.REFUND -> handleRefundResponse(resultCode, data)
            else -> pendingResult?.error("UNKNOWN_REQUEST", "Unknown request code: $requestCode", null)
        }
        return true
    }

    private fun handleSaleResponse(resultCode: Int, data: Intent?) {
        when (val response = EFTResponseFactory.getSaleResponse(resultCode, data)) {
            is Response.Success -> {


                val saleResponse = response.data

                // Create a JSON Object to map to Dart
                val saleResponseJson = JSONObject().apply {
                    put("operationId", saleResponse.operationId)
                    put("cryptogram", saleResponse.cryptogram)
                    put("documentNr", saleResponse.documentNr)
                    put("amountAuthorized", saleResponse.amountAuthorized)
                    put("amountAdditional", saleResponse.amountAdditional)
                    put("authCode", saleResponse.authCode)
                    put("RRN", saleResponse.RRN)
                    put("STAN", saleResponse.STAN)
                    put("cardType", saleResponse.cardType)
                    put("state", saleResponse.state)
                    put(
                        "CVMApplied",
                        JSONArray(saleResponse.CVMApplied.map { it.toString() })
                    ) // Assuming CVM is an Enum or object that can be stringified
                    put("receiptText", saleResponse.receiptText)
                    put("actionCode", saleResponse.actionCode)
                    put("cardPAN", saleResponse.cardPan)
                    put("cardName", saleResponse.cardName)
                    put("amountAdditionalField", JSONArray(saleResponse.additionalAmounts.map {
                        it
                    }))
                    put("DCCStatus", saleResponse.dccStatus)
                }

                pendingResult?.success(saleResponseJson.toString())


            }

            is Response.Error -> pendingResult?.error(response.errorCode, response.errorMessage, response.errorMessage)
            null -> pendingResult?.error("PAYMENT_ERROR", "Payment failed", null)

    }

}

// Example function for initiating a card payment
private fun initiateCardPayment(amount: Int?, currencyCode: String?, documentNr: String?) {
    // Here you initiate the card payment via your SDK or native logic
    // When done, call pendingResult?.success(resultJson) to return the result to Flutter

    // Example placeholder logic:
    val resultJson = JSONObject().apply {
        put("operationId", "123456")
        put("amountAuthorized", amount)
        put("currencyCode", currencyCode)
        put("documentNr", documentNr)
    }
    pendingResult?.success(resultJson.toString()) // Send the result back to Flutter
}


private fun handleVoidResponse(resultCode: Int, data: Intent?) {
    when (val response = EFTResponseFactory.getVoidResponse(resultCode, data)) {
        is Response.Success -> {
            val voidResponse = response.data
            val voidResponseJson = JSONObject().apply {
                put("operationId", voidResponse.operationId)
                put("amountAuthorized", voidResponse.amountAuthorized)
            }
            pendingResult?.success(voidResponseJson.toString())
        }

        is Response.Error -> pendingResult?.error(response.errorCode, response.errorMessage, response.errorMessage)
        null -> pendingResult?.error("VOID_ERROR", "Void transaction failed", null)
    }
}

private fun handleRefundResponse(resultCode: Int, data: Intent?) {
    when (val response = EFTResponseFactory.getRefundResponse(resultCode, data)) {
        is Response.Success -> {
            val refundResponse = response.data
            val refundResponseJson = JSONObject().apply {
                put("operationId", refundResponse.operationId)
                put("amountAuthorized", refundResponse.amountAuthorized)
            }
            pendingResult?.success(refundResponseJson.toString())
        }

        is Response.Error -> pendingResult?.error(response.errorCode, response.errorMessage, response.errorMessage)
        null -> pendingResult?.error("REFUND_ERROR", "Refund failed", null)
    }
}
}
