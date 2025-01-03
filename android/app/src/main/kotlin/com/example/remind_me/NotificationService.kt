package com.example.remind_me

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class NotificationService : BroadcastReceiver() {

        override fun onReceive(context: Context, intent: Intent) {

                val title = intent.getStringExtra("title")
                val description = intent.getStringExtra("description")
                val taskId = intent.getStringExtra("taskId")

                Log.d("NotificationService", "Title: $title")
                Log.d("NotificationService", "Description: $description")
                Log.d("NotificationService", "Task ID: $taskId")

                if (title == null || description == null) {
                        Log.e("NotificationService", "Title or description is null")
                        return
                }

                val notificationManager =
                        context.getSystemService(Context.NOTIFICATION_SERVICE) as
                                NotificationManager

                // Notification channel for Android 8.0+ (API level 26)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        val channel =
                                NotificationChannel(
                                        "task_channel",
                                        "Task Reminders",
                                        NotificationManager.IMPORTANCE_HIGH
                                )
                        notificationManager.createNotificationChannel(channel)
                        Log.d("NotificationService", "Notification Channel created")
                }

                // Create intent for Mark as Done action
                val markAsDoneIntent =
                        Intent(context, MarkAsDoneReceiver::class.java).apply {
                                putExtra("taskId", taskId)
                                putExtra("title", title)
                                putExtra("description", description)
                        }
                val markAsDonePendingIntent =
                        PendingIntent.getBroadcast(
                                context,
                                0,
                                markAsDoneIntent,
                                PendingIntent.FLAG_IMMUTABLE
                        )

                // Build the notification with an action button
                val notification =
                        NotificationCompat.Builder(context, "task_channel")
                                .setContentTitle(title)
                                .setContentText(description)
                                .setSmallIcon(android.R.drawable.ic_dialog_info)
                                .setPriority(NotificationCompat.PRIORITY_HIGH)
                                .setAutoCancel(true)
                                .addAction(
                                        android.R.drawable.ic_menu_view,
                                        "Mark as Done",
                                        markAsDonePendingIntent
                                )
                                .build()

                Log.d("NotificationService", "Notification built: $notification")

                notificationManager.notify(1, notification)
                Log.d("NotificationService", "Notification displayed")
        }
}

class MarkAsDoneReceiver : BroadcastReceiver() {
        companion object {
                var flutterEngine: FlutterEngine? = null
                private var eventSink: EventChannel.EventSink? = null

                fun setEventSink(eventSink: EventChannel.EventSink) {
                        this.eventSink = eventSink
                }
        }
        private var eventSink: EventChannel.EventSink? = null
        fun setEventSink(eventSink: EventChannel.EventSink) {
                this.eventSink = eventSink
        }
        override fun onReceive(
                context: Context,
                intent: Intent,
        ) {
                val title = intent.getStringExtra("title")
                val description = intent.getStringExtra("description")
                val taskId =
                        intent.getStringExtra(
                                "taskId",
                        )

                Log.d("MarkAsDoneReceiver", "Task ID: $taskId marked as done")

                // Use MethodChannel to send data back to Flutter
                // Create an intent to send the result back
                val resultIntent = Intent("ACTION_MARK_DONE")
                resultIntent.putExtra("taskId", taskId)
                resultIntent.putExtra("isDone", true)
                context.sendBroadcast(resultIntent)

                eventSink?.success(mapOf("taskId" to taskId, "isDone" to true))
                val engine = flutterEngine!!
                MethodChannel(
                                engine.dartExecutor.binaryMessenger,
                                "remind_me_android/notificationMarkAsDoneChannel"
                        )
                        .invokeMethod("markAsDone", taskId)
        }
}
