package com.example.flutter_android

import android.content.Context
import android.os.Bundle
import android.os.Handler
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.*
import java.util.*
import kotlin.collections.HashMap

class MainActivity : FlutterActivity() {

    private lateinit var mContext: Context

    private val mHandler = Handler()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        TestViewFactory.registerWith(flutterEngine)
        mContext = this
        registerMethodChannelFunction()
        registerBasicMessageChannelFunction()
        registerEventChannel()
    }

    private var mMethodChannel: MethodChannel? = null

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

    private var mBasicMessageChannel: BasicMessageChannel<Any>? = null

    private fun registerBasicMessageChannelFunction() {
        //获取BinaryMessenger
        val binaryMessenger = flutterEngine!!.dartExecutor.binaryMessenger
        //构建消息通道
        mBasicMessageChannel = BasicMessageChannel(
            binaryMessenger,
            "flutter_and_native_200",
            StandardMessageCodec.INSTANCE
        )
        //设置监听
        mBasicMessageChannel?.setMessageHandler { message, reply ->
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
            resultMap["message"] = "从Android返回(basicMessageChannel)：${System.currentTimeMillis()} "
            resultMap["code"] = 500
            //设置返回值，该方法只能使用一次
            reply.reply(resultMap)
        } else if (methodName == "test5") {
            //向Flutter发送消息
            Toast.makeText(mContext, "Flutter调用Android test5方法", Toast.LENGTH_SHORT).show()
            val resultMap = HashMap<String, Any>()
            resultMap["message"] = "向Flutter发送消息：${System.currentTimeMillis()} "
            resultMap["code"] = 600
            mBasicMessageChannel?.send(resultMap)
        }
    }

    private var mEventSink: EventChannel.EventSink? = null

    private fun registerEventChannel() {
        val binaryMessenger = flutterEngine!!.dartExecutor.binaryMessenger
        val mEventChannel = EventChannel(binaryMessenger, "flutter_and_native_300")
        mEventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                mEventSink = events
                startTimer()
            }

            override fun onCancel(arguments: Any?) {
                mEventSink = null
                stopTimer()
            }
        })
    }

    fun eventSendMessageFunction(message: String) {
        if (mEventSink != null) {
            mEventSink!!.success(message)
        } else {
            Log.e("TAG", "mEventSink is null")
        }
    }

    private var mTimer: Timer? = null

    fun startTimer() {
        mTimer = Timer()
        mTimer!!.schedule(object : TimerTask() {
            override fun run() {
                mHandler.post {
                    eventSendMessageFunction(System.currentTimeMillis().toString())
                }
            }
        }, 1200, 1000)
    }

    fun stopTimer() {
        mTimer?.cancel()
        mTimer = null
    }
}
