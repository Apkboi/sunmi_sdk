package com.palomapos.sunmi_sdk

import eu.ashburn.smartpos.api.SmartPosLogger

import kotlin.Exception

class CustomSmartPosLogger : SmartPosLogger {

    // Return whether debug logging is enabled (you can configure this based on your environment)
    override fun isDebugEnabled(): Boolean {
        return true // You can set this to false in production
    }

    // Handle debug messages
    override fun onDebug(message: String) {
        if (isDebugEnabled()) {
            println("DEBUG: $message")
        }
    }

    // Handle exceptions
    override fun onException(exception: Exception) {
        println("ERROR: ${exception.message}")
        exception.printStackTrace()
    }

    // Handle warnings
    override fun onWarning(message: String) {
        println("WARNING: $message")
    }
}
