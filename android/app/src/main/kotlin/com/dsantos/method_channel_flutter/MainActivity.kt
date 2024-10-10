package com.dsantos.method_channel_flutter

import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.dsantos.systemInfo";

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL,
        ).setMethodCallHandler { call, result ->
            if (call.method == "getSystemInfo") {
                val systemInfo = getSystemInfo()
                if (systemInfo != null) {
                    result.success(systemInfo)
                } else {
                    result.error("UNAVAILABLE", "System info not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getSystemInfo(): String {
        return "Android ${Build.VERSION.RELEASE} (SDK ${Build.VERSION.SDK_INT})"
    }
}
