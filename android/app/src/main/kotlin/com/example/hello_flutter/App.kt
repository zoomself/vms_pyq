package com.example.hello_flutter

import android.app.Application
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint

class App : Application() {


    override fun onCreate() {
        super.onCreate()
        //configFlutterEngines()
    }


    private fun configFlutterEngines(){
        val flutterEngineGroup = FlutterEngineGroup(this)
        //默认 routes "/"
        val defaultEngine=flutterEngineGroup.createAndRunDefaultEngine(this)
        FlutterEngineCache.getInstance().put("defaultEngine", defaultEngine)


        //routes "/moment_detail"
        val momentDetailOptions=FlutterEngineGroup.Options(this)
        momentDetailOptions.initialRoute = "moment_detail"
        /*momentDetailOptions.dartEntrypoint = DartEntrypoint(
            FlutterInjector.instance().flutterLoader().findAppBundlePath(),
            "detail"
        )*/
        //moment_detail 这个路由页面就直接生成了，initState方法 ,build已经ok了
        val momentDetailEngine=flutterEngineGroup.createAndRunEngine(momentDetailOptions)
        FlutterEngineCache.getInstance().put("momentDetailEngine", momentDetailEngine)

    }

}