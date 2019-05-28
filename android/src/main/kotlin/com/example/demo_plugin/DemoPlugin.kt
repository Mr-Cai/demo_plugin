package com.example.demo_plugin

import android.app.Activity
import android.os.Build
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class DemoPlugin(private val activity: Activity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "demo_plugin")
            channel.setMethodCallHandler(DemoPlugin(registrar.activity()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) = when {
        call.method == "getPlatformVersion" -> result.success("Android ${Build.VERSION.RELEASE}")
        call.method == "nativeToast" -> {
            Toast.makeText(activity, call.argument<String>("msg"), Toast.LENGTH_SHORT).show()
        }
        else -> result.notImplemented()
    }
}
