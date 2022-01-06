package com.example.myflutter

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * 向Flutter提供Android View
 */
class MyFlutterViewFactory(val messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val flutterView = MyFlutterView(context, messenger, viewId, args as Map<String, Any>?)
        return flutterView
    }
}