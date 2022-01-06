package com.example.myflutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

class CustomPlatformViewPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel

    companion object {
        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), "custom_platform_view")
            channel.setMethodCallHandler(CustomPlatformViewPlugin())

            registrar
                .platformViewRegistry()
                .registerViewFactory(
                    "plugins.flutter.io/custom_platform_view",
                    MyFlutterViewFactory(registrar.messenger())
                )
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(binding.getFlutterEngine().getDartExecutor(), "custom_platform_view")
        channel.setMethodCallHandler(this)

        val messenger: BinaryMessenger = binding.binaryMessenger
        binding
            .platformViewRegistry
            .registerViewFactory(
                "plugins.flutter.io/custom_platform_view", MyFlutterViewFactory(messenger)
            )

    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}