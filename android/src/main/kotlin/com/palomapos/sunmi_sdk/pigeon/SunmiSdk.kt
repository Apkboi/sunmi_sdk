// Autogenerated from Pigeon (v22.5.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")


import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is FlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

/** Generated class from Pigeon that represents data sent in messages. */
data class SaleRequest (
  val amount: Long? = null,
  val currencyCode: String? = null,
  val documentNr: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): SaleRequest {
      val amount = pigeonVar_list[0] as Long?
      val currencyCode = pigeonVar_list[1] as String?
      val documentNr = pigeonVar_list[2] as String?
      return SaleRequest(amount, currencyCode, documentNr)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      amount,
      currencyCode,
      documentNr,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class SaleResponse (
  val status: String? = null,
  val message: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): SaleResponse {
      val status = pigeonVar_list[0] as String?
      val message = pigeonVar_list[1] as String?
      return SaleResponse(status, message)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      status,
      message,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class RefundRequest (
  val refundAmount: Long? = null,
  val currencyCode: String? = null,
  val documentNr: String? = null,
  val stan: String? = null,
  val transactionDate: String? = null,
  val rrn: String? = null,
  val skipReceiptPrint: Boolean? = null,
  val skipCustomerReceiptPrint: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): RefundRequest {
      val refundAmount = pigeonVar_list[0] as Long?
      val currencyCode = pigeonVar_list[1] as String?
      val documentNr = pigeonVar_list[2] as String?
      val stan = pigeonVar_list[3] as String?
      val transactionDate = pigeonVar_list[4] as String?
      val rrn = pigeonVar_list[5] as String?
      val skipReceiptPrint = pigeonVar_list[6] as Boolean?
      val skipCustomerReceiptPrint = pigeonVar_list[7] as Boolean?
      return RefundRequest(refundAmount, currencyCode, documentNr, stan, transactionDate, rrn, skipReceiptPrint, skipCustomerReceiptPrint)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      refundAmount,
      currencyCode,
      documentNr,
      stan,
      transactionDate,
      rrn,
      skipReceiptPrint,
      skipCustomerReceiptPrint,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class VoidRequest (
  val operationId: String? = null,
  val partialVoidAmount: Long? = null,
  val skipReceiptPrint: Boolean? = null,
  val skipCustomerReceiptPrint: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): VoidRequest {
      val operationId = pigeonVar_list[0] as String?
      val partialVoidAmount = pigeonVar_list[1] as Long?
      val skipReceiptPrint = pigeonVar_list[2] as Boolean?
      val skipCustomerReceiptPrint = pigeonVar_list[3] as Boolean?
      return VoidRequest(operationId, partialVoidAmount, skipReceiptPrint, skipCustomerReceiptPrint)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      operationId,
      partialVoidAmount,
      skipReceiptPrint,
      skipCustomerReceiptPrint,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class CloseDocumentRequest (
  val documentNr: String? = null,
  val operationIdList: List<String>? = null,
  val skipReceiptPrint: Boolean? = null,
  val skipCustomerReceiptPrint: Boolean? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): CloseDocumentRequest {
      val documentNr = pigeonVar_list[0] as String?
      val operationIdList = pigeonVar_list[1] as List<String>?
      val skipReceiptPrint = pigeonVar_list[2] as Boolean?
      val skipCustomerReceiptPrint = pigeonVar_list[3] as Boolean?
      return CloseDocumentRequest(documentNr, operationIdList, skipReceiptPrint, skipCustomerReceiptPrint)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      documentNr,
      operationIdList,
      skipReceiptPrint,
      skipCustomerReceiptPrint,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class RefundResponse (
  val operationId: String? = null,
  val cryptogram: String? = null,
  val documentNr: String? = null,
  val amountAuthorized: Long? = null,
  val amountAdditional: Long? = null,
  val authCode: String? = null,
  val rrn: String? = null,
  val stan: String? = null,
  val cardType: String? = null,
  val state: String? = null,
  val receiptText: String? = null,
  val actionCode: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): RefundResponse {
      val operationId = pigeonVar_list[0] as String?
      val cryptogram = pigeonVar_list[1] as String?
      val documentNr = pigeonVar_list[2] as String?
      val amountAuthorized = pigeonVar_list[3] as Long?
      val amountAdditional = pigeonVar_list[4] as Long?
      val authCode = pigeonVar_list[5] as String?
      val rrn = pigeonVar_list[6] as String?
      val stan = pigeonVar_list[7] as String?
      val cardType = pigeonVar_list[8] as String?
      val state = pigeonVar_list[9] as String?
      val receiptText = pigeonVar_list[10] as String?
      val actionCode = pigeonVar_list[11] as String?
      return RefundResponse(operationId, cryptogram, documentNr, amountAuthorized, amountAdditional, authCode, rrn, stan, cardType, state, receiptText, actionCode)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      operationId,
      cryptogram,
      documentNr,
      amountAuthorized,
      amountAdditional,
      authCode,
      rrn,
      stan,
      cardType,
      state,
      receiptText,
      actionCode,
    )
  }
}

/** Generated class from Pigeon that represents data sent in messages. */
data class VoidResponse (
  val operationId: String? = null,
  val cryptogram: String? = null,
  val documentNr: String? = null,
  val amountAuthorized: Long? = null,
  val amountAdditional: Long? = null,
  val authCode: String? = null,
  val rrn: String? = null,
  val stan: String? = null,
  val cardType: String? = null,
  val state: String? = null,
  val receiptText: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): VoidResponse {
      val operationId = pigeonVar_list[0] as String?
      val cryptogram = pigeonVar_list[1] as String?
      val documentNr = pigeonVar_list[2] as String?
      val amountAuthorized = pigeonVar_list[3] as Long?
      val amountAdditional = pigeonVar_list[4] as Long?
      val authCode = pigeonVar_list[5] as String?
      val rrn = pigeonVar_list[6] as String?
      val stan = pigeonVar_list[7] as String?
      val cardType = pigeonVar_list[8] as String?
      val state = pigeonVar_list[9] as String?
      val receiptText = pigeonVar_list[10] as String?
      return VoidResponse(operationId, cryptogram, documentNr, amountAuthorized, amountAdditional, authCode, rrn, stan, cardType, state, receiptText)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      operationId,
      cryptogram,
      documentNr,
      amountAuthorized,
      amountAdditional,
      authCode,
      rrn,
      stan,
      cardType,
      state,
      receiptText,
    )
  }
}
private open class SunmiSdkPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SaleRequest.fromList(it)
        }
      }
      130.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          SaleResponse.fromList(it)
        }
      }
      131.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          RefundRequest.fromList(it)
        }
      }
      132.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          VoidRequest.fromList(it)
        }
      }
      133.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          CloseDocumentRequest.fromList(it)
        }
      }
      134.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          RefundResponse.fromList(it)
        }
      }
      135.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          VoidResponse.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is SaleRequest -> {
        stream.write(129)
        writeValue(stream, value.toList())
      }
      is SaleResponse -> {
        stream.write(130)
        writeValue(stream, value.toList())
      }
      is RefundRequest -> {
        stream.write(131)
        writeValue(stream, value.toList())
      }
      is VoidRequest -> {
        stream.write(132)
        writeValue(stream, value.toList())
      }
      is CloseDocumentRequest -> {
        stream.write(133)
        writeValue(stream, value.toList())
      }
      is RefundResponse -> {
        stream.write(134)
        writeValue(stream, value.toList())
      }
      is VoidResponse -> {
        stream.write(135)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface SunmiSdkApi {
  fun initiateRefund(documentNr: String, refundAmount: Long, stan: String, rrn: String, currencyCode: String, skipReceiptPrint: Boolean, skipCustomerReceiptPrint: Boolean): RefundResponse
  fun initiateVoid(operationId: String, partialVoidAmount: Long, skipReceiptPrint: Boolean, skipCustomerReceiptPrint: Boolean): VoidResponse
  fun closeDocument(documentNr: String, operationIdList: List<String>, skipReceiptPrint: Boolean, skipCustomerReceiptPrint: Boolean)
  fun printPlaintext(text: String)
  fun setApplicationMode(apiKey: String, mode: String)
  fun startCardPayment(request: SaleRequest): SaleResponse

  companion object {
    /** The codec used by SunmiSdkApi. */
    val codec: MessageCodec<Any?> by lazy {
      SunmiSdkPigeonCodec()
    }
    /** Sets up an instance of `SunmiSdkApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: SunmiSdkApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.initiateRefund$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val documentNrArg = args[0] as String
            val refundAmountArg = args[1] as Long
            val stanArg = args[2] as String
            val rrnArg = args[3] as String
            val currencyCodeArg = args[4] as String
            val skipReceiptPrintArg = args[5] as Boolean
            val skipCustomerReceiptPrintArg = args[6] as Boolean
            val wrapped: List<Any?> = try {
              listOf(api.initiateRefund(documentNrArg, refundAmountArg, stanArg, rrnArg, currencyCodeArg, skipReceiptPrintArg, skipCustomerReceiptPrintArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.initiateVoid$separatedMessageChannelSuffix", codec)
        if (api != null) {

          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val operationIdArg = args[0] as String
            val partialVoidAmountArg = args[1] as Long
            val skipReceiptPrintArg = args[2] as Boolean
            val skipCustomerReceiptPrintArg = args[3] as Boolean
            val wrapped: List<Any?> = try {
              listOf(api.initiateVoid(operationIdArg, partialVoidAmountArg, skipReceiptPrintArg, skipCustomerReceiptPrintArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.closeDocument$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val documentNrArg = args[0] as String
            val operationIdListArg = args[1] as List<String>
            val skipReceiptPrintArg = args[2] as Boolean
            val skipCustomerReceiptPrintArg = args[3] as Boolean
            val wrapped: List<Any?> = try {
              api.closeDocument(documentNrArg, operationIdListArg, skipReceiptPrintArg, skipCustomerReceiptPrintArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.printPlaintext$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val textArg = args[0] as String
            val wrapped: List<Any?> = try {
              api.printPlaintext(textArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.setApplicationMode$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val apiKeyArg = args[0] as String
            val modeArg = args[1] as String
            val wrapped: List<Any?> = try {
              api.setApplicationMode(apiKeyArg, modeArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.sunmi_sdk.SunmiSdkApi.startCardPayment$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val requestArg = args[0] as SaleRequest
            val wrapped: List<Any?> = try {
              listOf(api.startCardPayment(requestArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
