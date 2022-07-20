package com.example.flutter_android

import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StandardMessageCodec

class MainActivity : FlutterActivity() {

    private lateinit var mContext: Context
    private var mMethodChannel: MethodChannel? = null
    private var basicMessageChannel: BasicMessageChannel<Any>? = null
    private val mHandler = Handler()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mContext = this;
        registerMethodChannelFunction()
        registerBasicMessageChannelFunction();
    }

    private fun registerMethodChannelFunction() {
        if (flutterEngine == null) {
            Log.e("TAG", "注册消息通道失败 flutterEngine = null")
            return
        }

        //获取Dart缓存编译对象
        val dartExecutor: DartExecutor = flutterEngine!!.dartExecutor
        //获取BinaryMessenger
        val binaryMessenger: BinaryMessenger = dartExecutor.binaryMessenger
        //获取通道标识
        val channelName = "flutter_and_native_100"
        //构建消息通道
        mMethodChannel = MethodChannel(binaryMessenger, channelName)
        //设置监听
        mMethodChannel!!.setMethodCallHandler { call, result ->
            val methodName = call.method
            val arguments: HashMap<String, Any?>? = call.arguments as HashMap<String, Any?>?
            methodCallFunction(result, methodName, arguments)
        }
    }

    private fun methodCallFunction(
        result: MethodChannel.Result,
        methodName: String,
        arguments: HashMap<String, Any?>?
    ) {
        when (methodName) {
            "test" -> {
                Toast.makeText(mContext, "Flutter调用Android的test无参方法", Toast.LENGTH_SHORT).show()
                val resultMap = HashMap<String, Any>()
                resultMap["message"] = "从Android返回： ${System.currentTimeMillis()}"
                resultMap["code"] = 200
                result.success(resultMap)
            }
            "test2" -> {
                Toast.makeText(
                    mContext,
                    "Flutter调用Android的test有参方法",
                    Toast.LENGTH_SHORT
                ).show()
                val resultMap = HashMap<String, Any>()
                resultMap["message"] =
                    "从Android返回： ${System.currentTimeMillis()} ${arguments?.get("name")}"
                resultMap["code"] = 300
                result.success(resultMap)
            }
            "test3" -> {
                Toast.makeText(mContext, "Flutter调用Android的test3方法", Toast.LENGTH_SHORT).show()
                val resultMap = HashMap<String, Any>()
                resultMap["message"] = "Android调Flutter方法"
                resultMap["code"] = 400
                mMethodChannel?.invokeMethod("test3", resultMap)
            }
            else -> {
                Toast.makeText(mContext, "notImplemented", Toast.LENGTH_SHORT).show()
                result.notImplemented()
            }
        }
    }

    private fun registerBasicMessageChannelFunction() {
        //获取BinaryMessenger
        val binaryMessenger = flutterEngine!!.dartExecutor.binaryMessenger
        //构建消息通道
        basicMessageChannel = BasicMessageChannel<Any>(
            binaryMessenger,
            "flutter_and_native_200",
            StandardMessageCodec.INSTANCE
        )
        //设置坚挺
        basicMessageChannel?.setMessageHandler { message, reply ->
            val arguments: HashMap<String, Any> = message as HashMap<String, Any>
            try {
                basicMessageChannelCallFunction(reply, arguments)
            } catch (e: Exception) {
                e.printStackTrace()
                val resultMap = HashMap<String, Any>()
                resultMap["message"] = "发生异常${e.message}"
                resultMap["code"] = -1
                reply.reply(resultMap)
            }
        }

    }

    private fun basicMessageChannelCallFunction(
        reply: BasicMessageChannel.Reply<Any>,
        arguments: HashMap<String, Any>
    ) {
        val methodName = arguments["method"]
        if (methodName == "test4") {
            Toast.makeText(mContext, "Flutter调用Android test4方法", Toast.LENGTH_SHORT).show()
            val resultMap = HashMap<String, Any>()
            resultMap["message"] = "从Android返回：${System.currentTimeMillis()} "
            resultMap["code"] = 500
            //该方法只能使用一次
            reply.reply(resultMap)
        }


    }
}
