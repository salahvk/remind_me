package com.example.remind_me

import android.os.Bundle

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*
import io.flutter.plugins.remind_me.NotificationService


class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.taskbuddy/notifications"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "scheduleNotification") {
                val title = call.argument<String>("title")
                val description = call.argument<String>("description")
                val timeMillis = call.argument<Long>("timeMillis")

                scheduleNotification(title!!, description!!, timeMillis!!)
                result.success(null)
            }
        }
    }

    private fun scheduleNotification(title: String, description: String, timeMillis: Long) {
        val intent = Intent(applicationContext, NotificationService::class.java).apply {
            putExtra("title", title)
            putExtra("description", description)
        }

        val pendingIntent = PendingIntent.getBroadcast(
            applicationContext,
            0,
            intent,
            PendingIntent.FLAG_MUTABLE
        )

        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarmManager.setExact(
            AlarmManager.RTC_WAKEUP,
            timeMillis,
            pendingIntent
        )
    }
}
