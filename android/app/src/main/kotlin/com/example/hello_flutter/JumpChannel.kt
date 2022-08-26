package com.example.hello_flutter

import android.content.Intent
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class JumpChannel(flutterEngine: FlutterEngine, var activity: FlutterActivity) :

    MethodChannel.MethodCallHandler {

    private var methodChannel: MethodChannel =
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.zoomself.vms")

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.i("zoomself","onMethodCall ${call.method} ${call.arguments}  ")
        if (call.method.equals("needLogin")) {
           activity.startActivity(Intent(activity, LoginActivity::class.java))
           result.success("跳转LoginActivity成功")
        }else if (call.method.equals("goTest")) {
            //activity.startActivity(Intent(activity, LoginActivity::class.java))
            result.success("test成功")
        }else{
            result.notImplemented()
        }
    }

}