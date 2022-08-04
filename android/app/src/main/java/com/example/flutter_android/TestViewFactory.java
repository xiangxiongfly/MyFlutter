package com.example.flutter_android;

import android.content.Context;

import java.util.Map;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.platform.PlatformViewRegistry;

public class TestViewFactory extends PlatformViewFactory {
    public TestViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    public TestViewFactory(MessageCodec<Object> createArgsCodec) {
        super(createArgsCodec);
    }

    @Override
    public PlatformView create(Context context, int id, Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        return new MyTextView(context, id, params);
    }

    public static void registerWith(FlutterEngine flutterEngine) {
        PlatformViewRegistry registry = flutterEngine.getPlatformViewsController().getRegistry();
        //参数1：设置标识
        //参数2：自定义的Android原生View
        registry.registerViewFactory("com.hello.world", new TestViewFactory());
    }
}
