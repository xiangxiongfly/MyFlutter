package com.example.flutter_android;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMessageCodec;

public class MainActivity extends FlutterActivity {

    private Context mContext;
    private Handler mHandler = new Handler();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mContext = this;
        TestViewFactory.registerWith(getFlutterEngine());
        registerMethodChannelFunction();
        registerBasicMessageChannelFunction();
        registerEventChannel();
    }

    private MethodChannel mMethodChannel;

    private void registerMethodChannelFunction() {
        FlutterEngine flutterEngine = getFlutterEngine();
        if (flutterEngine == null) {
            Log.e("TAG", "注册消息通道失败 flutterEngine = null");
            return;
        }
        //获取Dart缓存编译对象
        DartExecutor dartExecutor = flutterEngine.getDartExecutor();
        //获取BinaryMessenger
        BinaryMessenger binaryMessenger = dartExecutor.getBinaryMessenger();
        //获取通道标识
        String channelName = "flutter_and_native_100";
        //构建消息通道
        mMethodChannel = new MethodChannel(binaryMessenger, channelName);
        //设置监听
        mMethodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                String methodName = call.method;
                HashMap<String, Object> arguments = (HashMap<String, Object>) call.arguments;
                methodCallFunction(result, methodName, arguments);
            }
        });
    }

    private void methodCallFunction(MethodChannel.Result result, String methodName, HashMap<String, Object> arguments) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        switch (methodName) {
            case "test":
                Toast.makeText(mContext, "Flutter调用Android的test无参方法", Toast.LENGTH_SHORT).show();
                resultMap.put("message", "从Android返回：" + System.currentTimeMillis());
                resultMap.put("code", 200);
                result.success(resultMap);
                break;
            case "test2": {
                Toast.makeText(mContext, "Flutter调用Android的test2有参方法", Toast.LENGTH_SHORT).show();
                resultMap.put("message", "从Android返回：" + System.currentTimeMillis() + " " + arguments.get("name"));
                resultMap.put("code", 300);
                result.success(resultMap);
                break;
            }
            case "test3": {
                Toast.makeText(mContext, "Flutter调用Android的test3方法", Toast.LENGTH_SHORT).show();
                resultMap.put("message", "Android调Flutter方法");
                resultMap.put("code", 400);
                mMethodChannel.invokeMethod("test3", resultMap);
                break;
            }
            default: {
                Toast.makeText(mContext, "notImplemented", Toast.LENGTH_SHORT).show();
                result.notImplemented();
            }
        }
    }

    private BasicMessageChannel mBasicMessageChannel;

    private void registerBasicMessageChannelFunction() {
        FlutterEngine flutterEngine = getFlutterEngine();
        if (flutterEngine == null) {
            Log.e("TAG", "注册消息通道失败 flutterEngine = null");
            return;
        }
        BinaryMessenger binaryMessenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        mBasicMessageChannel = new BasicMessageChannel(binaryMessenger, "flutter_and_native_200", StandardMessageCodec.INSTANCE);
        mBasicMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler() {
            @Override
            public void onMessage(@Nullable Object message, @NonNull BasicMessageChannel.Reply reply) {
                HashMap<String, Object> arguments = (HashMap<String, Object>) message;
                try {
                    basicMessageChannelCallFunction(reply, arguments);
                } catch (Exception e) {
                    e.printStackTrace();
                    HashMap<String, Object> resultMap = new HashMap<String, Object>();
                    resultMap.put("message", "发生异常" + e.getMessage());
                    resultMap.put("code", -1);
                    reply.reply(resultMap);
                }
            }
        });
    }

    private void basicMessageChannelCallFunction(BasicMessageChannel.Reply reply, HashMap<String, Object> arguments) {
        String methodName = (String) arguments.get("method");
        if ("test4".equals(methodName)) {
            Toast.makeText(mContext, "Flutter调用Android test4方法", Toast.LENGTH_SHORT).show();
            HashMap<String, Object> resultMap = new HashMap<>();
            resultMap.put("message", "从Android返回(basicMessageChannel)：" + System.currentTimeMillis());
            resultMap.put("code", 500);
            //设置返回值，该方法只能使用一次
            reply.reply(resultMap);
        } else {
            //向Flutter发送消息
            Toast.makeText(mContext, "Flutter调用Android test5方法", Toast.LENGTH_SHORT).show();
            HashMap<String, Object> resultMap = new HashMap<>();
            resultMap.put("message", "向Flutter发送消息：" + System.currentTimeMillis());
            resultMap.put("code", 600);
            mBasicMessageChannel.send(resultMap);
        }
    }

    private EventChannel.EventSink mEventSink;

    private void registerEventChannel() {
        FlutterEngine flutterEngine = getFlutterEngine();
        if (flutterEngine == null) {
            Log.e("TAG", "注册消息通道失败 flutterEngine = null");
            return;
        }
        BinaryMessenger binaryMessenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        EventChannel mEventChannel = new EventChannel(binaryMessenger, "flutter_and_native_300");
        mEventChannel.setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                mEventSink = events;
                startTimer();
            }

            @Override
            public void onCancel(Object arguments) {
                mEventSink = null;
                stopTimer();
            }
        });
    }

    private void eventSendMessageFunction(String message) {
        if (mEventSink != null) {
            mEventSink.success(message);
        } else {
            Log.e("TAG", "mEventSink is null");
        }
    }

    private Timer mTimer;

    private void startTimer() {
        mTimer = new Timer();
        mTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                mHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        eventSendMessageFunction(String.valueOf(System.currentTimeMillis()));
                    }
                });
            }
        }, 1200, 1000);
    }

    private void stopTimer() {
        if (mTimer != null) {
            mTimer.cancel();
            mTimer = null;
        }
    }
}
