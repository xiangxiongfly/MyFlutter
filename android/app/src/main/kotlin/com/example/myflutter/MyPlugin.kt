package com.example.myflutter

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry

/**
 * 注册Android View，
 */
class MyPlugin : FlutterPlugin {
//    companion object {
//        @JvmStatic
//        fun registerWith(registrar: PluginRegistry.Registrar) {
//            registrar.platformViewRegistry()
//                .registerViewFactory(
//                    "plugins.flutter.io/custom_platform_view",
//                    MyFlutterViewFactory(registrar.messenger())
//                )
//        }
//    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val messenger: BinaryMessenger = binding.binaryMessenger
        binding.platformViewRegistry.registerViewFactory(
            "plugins.flutter.io/custom_platform_view",
            MyFlutterViewFactory(messenger)
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }
}