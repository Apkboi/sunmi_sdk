package com.palomapos.sunmi_sdk

import android.content.Context
import eu.ashburn.smartpos.api.EFTRequestFactory
import eu.ashburn.smartpos.api.model.CloseDocumentRequestModel
import eu.ashburn.smartpos.api.model.PrintPlaintextRequestModel
import eu.ashburn.smartpos.api.model.RefundRequestModel
import eu.ashburn.smartpos.api.model.SaleRequestModel
import eu.ashburn.smartpos.api.model.SetApplicationModeRequestModel
import eu.ashburn.smartpos.api.model.VoidRequestModel
import eu.ashburn.smartpos.api.requests.CloseDocumentRequest
import eu.ashburn.smartpos.api.requests.SetApplicationModeRequest
import eu.ashburn.smartpos.api.requests.SaleRequest
import eu.ashburn.smartpos.api.requests.PrintPlaintextRequest
import eu.ashburn.smartpos.api.requests.RefundRequest
import eu.ashburn.smartpos.api.requests.VoidRequest
import java.util.Date

class SunmiSdkHandler(private val context: Context) {


    // Function to return SaleRequest instead of Intent for card payment
    fun startCardPayment(
        amount: Long, currencyCode: String, documentNr: String, skipReceiptPrint: Boolean,
        skipCustomerReceiptPrint: Boolean
    ): SaleRequest {
        // Create version string from package name and version code
        val ecrVersion = "${context.packageName}-1.0.0"

        // Create EFTRequestFactory instance
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        // Create SaleRequestModel with payment details
        val saleRequest = eftFactory.getSaleRequest(SaleRequestModel(amount, currencyCode, documentNr, skipReceiptPrint, skipCustomerReceiptPrint))

        // Return the SaleRequest instead of intent
        return saleRequest
    }

    // Function to return SetApplicationModeRequest instead of Intent
    fun setApplicationMode(apiKey: String, mode: String): SetApplicationModeRequest {
        // Create the version string using package name and version code
        val ecrVersion = "${context.packageName}-1.0.0"

        // Create an instance of EFTRequestFactory with logger and version
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        // Create SetApplicationModeRequestModel with the provided apiKey and mode
        val setApplicationModeRequest = eftFactory.getSetApplicationModeRequest(
            SetApplicationModeRequestModel(apiKey, mode)
        )

        // Return the SetApplicationModeRequest instead of intent
        return setApplicationModeRequest
    }

    // Function to return PrintPlaintextRequest instead of Intent for printing
    fun printPlaintext(text: String): PrintPlaintextRequest {
        // Create version string using package name and version code
        val ecrVersion = "${context.packageName}-1.0.0"

        // Create an instance of EFTRequestFactory with logger and version
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        // Create PrintPlaintextRequestModel with the provided text
        val printRequest = eftFactory.getPrintPlaintextRequest(
            PrintPlaintextRequestModel(text)
        )

        // Return the PrintPlaintextRequest instead of intent
        return printRequest
    }

    fun initiateRefund(
        refundAmount: Long,
        currencyCode: String,
        documentNr: String,
        stan: String,
        date: Date,
        rrn: String,
        skipReceiptPrint: Boolean,
        skipCustomerReceiptPrint: Boolean
    ): RefundRequest {
        // Create version string using package name and version code
        val ecrVersion = "${context.packageName}-1.0.0"

        // Create an instance of EFTRequestFactory with logger and version
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        // Create the RefundRequestModel with all the necessary fields
        val refundRequestModel = RefundRequestModel(
            refundAmount = refundAmount,
            currencyCode = currencyCode,
            documentNr = documentNr,
            stan = stan,
            date = date,
            rrn = rrn,
            skipReceiptPrint = skipReceiptPrint,
            skipCustomerReceiptPrint = skipCustomerReceiptPrint
        )

        // Create the RefundRequest from the factory using the RefundRequestModel
        return eftFactory.getRefundRequest(refundRequestModel)
    }


    fun initiateVoid(
        operationId: String, skipReceiptPrint: Boolean, skipCustomerReceiptPrint: Boolean, partialVoidAmount: Long? = null
    ): VoidRequest? {
        // Create version string using package name and version code
        val ecrVersion = "${context.packageName}-1.0.0"

        // Create an instance of EFTRequestFactory with logger and version
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        // Create the VoidRequestModel with all the necessary fields
        val voidRequestModel = partialVoidAmount?.let {
            VoidRequestModel(
                operationId = operationId, skipReceiptPrint = skipReceiptPrint, skipCustomerReceiptPrint = skipCustomerReceiptPrint, partialVoidAmount = it
            )
        }

        // Create and return the VoidRequest from the factory using the VoidRequestModel
        return voidRequestModel?.let { eftFactory.getVoidRequest(it) }
    }

    fun closeDocument(
        documentNr: String, operationIdList: List<String>, skipReceiptPrint: Boolean, skipCustomerReceiptPrint: Boolean
    ): CloseDocumentRequest? {
        val ecrVersion = "${context.packageName}-1.0.0"
        val eftFactory = EFTRequestFactory(CustomSmartPosLogger(), ecrVersion)

        val closeDocumentRequestModel = CloseDocumentRequestModel(
            documentNr = documentNr, operationIdList = operationIdList, skipReceiptPrint = skipReceiptPrint, skipCustomerReceiptPrint = skipCustomerReceiptPrint
        )

        // Create and return the CloseDocumentRequest
        return eftFactory.getCloseDocRequest(closeDocumentRequestModel)
    }


}
