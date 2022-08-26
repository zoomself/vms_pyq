package com.example.hello_flutter

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity

class LoginActivity : AppCompatActivity() {
    private lateinit var tv:TextView
    private lateinit var tv_test:TextView
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
        tv=findViewById(R.id.tv)
        tv_test=findViewById(R.id.tv_test)
        tv.setOnClickListener {
            //  val intent=FlutterActivity.withNewEngine().initialRoute("/").build(this)
            val intent=FlutterActivity.withCachedEngine("defaultEngine").build(this)
            startActivity(intent)
        }
        tv_test.setOnClickListener {
            //val intent=FlutterActivity.withNewEngine().initialRoute("moment_detail").build(this)
            val intent=FlutterActivity.withCachedEngine("momentDetailEngine").build(this)
            startActivity(intent)

        }
    }
}