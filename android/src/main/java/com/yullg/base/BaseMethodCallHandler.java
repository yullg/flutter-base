package com.yullg.base;

import android.content.Context;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.exifinterface.media.ExifInterface;

import org.json.JSONObject;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class BaseMethodCallHandler implements MethodChannel.MethodCallHandler {

    private final Context context;
    private final ToastHandler toastHandler;
    private final ExifHandler exifHandler;

    public BaseMethodCallHandler(Context context) {
        this.context = context;
        toastHandler = new ToastHandler();
        exifHandler = new ExifHandler();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        try {
            if ("showToast".equals(call.method)) {
                JSONObject jsonObj = new JSONObject(call.arguments.toString());
                final String text = jsonObj.getString("text");
                final boolean durable = jsonObj.optBoolean("durable");
                toastHandler.show(text, durable ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT);
                result.success(null);
            } else if ("hideToast".equals(call.method)) {
                toastHandler.hide();
                result.success(null);
            } else if ("getRotationDegrees".equals(call.method)) {
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

    private class ToastHandler {
        private Toast toast;

        public void show(String text, int duration) {
            try {
                hide();
            } finally {
                toast = Toast.makeText(context, text, duration);
                toast.show();
            }
        }

        public void hide() {
            if (toast != null) {
                toast.cancel();
                toast = null;
            }
        }
    }

    private class ExifHandler {

        public int getRotationDegrees(String path) throws Exception {
            ExifInterface exifInterface = new ExifInterface(path);
            return exifInterface.getRotationDegrees();
        }

    }

}