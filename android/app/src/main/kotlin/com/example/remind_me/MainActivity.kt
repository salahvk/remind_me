package com.example.remind_me

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.remind_me.NotificationService

class MainActivity : FlutterActivity() {
    private lateinit var notificationService: NotificationService
    private val CHANNEL = "com.example.remind_me/notifications"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        notificationService = NotificationService(this)

        // Set up MethodChannel to listen to Flutter requests
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "showNotification" -> {
                    val taskTitle = call.argument<String>("taskTitle") ?: ""
                    val taskDescription = call.argument<String>("taskDescription") ?: ""
                    notificationService.showNotification(taskTitle, taskDescription)
                    result.success(null)
                }
                "provideHapticFeedback" -> {
                    notificationService.provideHapticFeedback()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
