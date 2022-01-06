package com.example.myflutter

import android.app.Activity
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import java.util.*
import kotlin.concurrent.timerTask

/**
 * 创建一个Android View，用于嵌入到Flutter中
 *
 * messenger：用于消息传递
 * viewId：唯一ID
 * args：Flutter传递的初始化参数
 */
class MyFlutterView(
    val context: Context,
    messenger: BinaryMessenger,
    viewId: Int,
    args: Map<String, Any>?
) : PlatformView, MethodChannel.MethodCallHandler {

    private val handler = Handler(Looper.getMainLooper())

    val textView = TextView(context);

    private var channel: MethodChannel

    init {
        channel = MethodChannel(messenger, "com.example.myflutter.MyFlutterView")
        channel.setMethodCallHandler(this)

        args?.let {
            textView.text =
                "这是一个Android View 参数1：${it["param1"]} 参数2：${it["param2"]}"
        }

        startTimer()
    }

    private var count = 0
    private var timer: Timer? = null
    private fun startTimer() {
        timer = Timer()
        timer!!.schedule(timerTask {
            handler.post {
                val map = mapOf("count" to count++)
                channel.invokeMethod("onFlutterMethod", map)
            }
        }, 0, 500)
    }

    /**
     * getView：返回要嵌入Flutter层次结构的Android View
     */
    override fun getView(): View {
        return textView
    }

    /**
     * dispose：释放Android View
     */
    override fun dispose() {
        timer?.cancel()
        timer = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "setData") {
            val name = call.argument<String>("name")
            val age = call.argument<Int>("age")
            textView.text = "setData方法（姓名：$name  年龄：$age）"
        } else if (call.method == "getData") {
            val param = call.argument<String>("param")
            val map = mapOf<String, String>("content" to param.toString().toUpperCase())
            result.success(map)
        } else {
            result.notImplemented()
        }
    }
}