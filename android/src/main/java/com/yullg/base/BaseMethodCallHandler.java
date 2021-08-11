package com.yullg.base;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.exifinterface.media.ExifInterface;

import org.json.JSONObject;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class BaseMethodCallHandler implements MethodChannel.MethodCallHandler {

    private final Context context;
    private final ExifHandler exifHandler;

    public BaseMethodCallHandler(Context context) {
        this.context = context;
        exifHandler = new ExifHandler();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        try {
            if ("getRotationDegrees".equals(call.method)) {
                JSONObject jsonObj = new JSONObject(call.arguments.toString());
                final String path = jsonObj.getString("path");
                int rotationDegrees = exifHandler.getRotationDegrees(path);
                result.success(rotationDegrees);
            } else {
                result.notImplemented();
            }
        } catch (Exception e) {
            result.error(e.getClass().getSimpleName(), e.getMessage(), null);
        }
    }

    private class ExifHandler {

        public int getRotationDegrees(String path) throws Exception {
            ExifInterface exifInterface = new ExifInterface(path);
            return exifInterface.getRotationDegrees();
        }

    }

}