package com.example.flutter_android;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import androidx.annotation.Nullable;
import io.flutter.plugin.platform.PlatformView;

public class MyTextView implements PlatformView {
    private final TextView myTextView;

    public MyTextView(Context context, int id, Map<String, Object> params) {
        myTextView = new TextView(context);
        myTextView.setText("Android TextView");
        if (params != null && params.containsKey("content")) {
            String content = (String) params.get("content");
            String color = (String) params.get("color");
            myTextView.setText(content);
            myTextView.setTextColor(Color.parseColor(color));
        }
    }

    @Override
    public View getView() {
        return myTextView;
    }

    @Override
    public void dispose() {

    }
}
