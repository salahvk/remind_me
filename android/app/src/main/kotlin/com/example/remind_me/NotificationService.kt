package com.example.remind_me

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat

class NotificationService : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        // Log the title and description received from the intent
        val title = intent.getStringExtra("title")
        val description = intent.getStringExtra("description")

        Log.d("NotificationService", "Title: $title")
        Log.d("NotificationService", "Description: $description")

        // Check if title and description are not null
        if (title == null || description == null) {
            Log.e("NotificationService", "Title or description is null")
            return
        }

        // Create notification manager
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        // Create notification channel for Android 8.0+ (API level 26)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "task_channel",
                "Task Reminders",
                NotificationManager.IMPORTANCE_HIGH
            )
            notificationManager.createNotificationChannel(channel)
            Log.d("NotificationService", "Notification Channel created")
        }

        // Build the notification
        val notification = NotificationCompat.Builder(context, "task_channel")
            .setContentTitle(title)
            .setContentText(description)
            .setSmallIcon(android.R.drawable.ic_dialog_info) // Replace with your icon
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setAutoCancel(true)
            .build()

        Log.d("NotificationService", "Notification built: $notification")

        // Show the notification
        notificationManager.notify(1, notification)
        Log.d("NotificationService", "Notification displayed")
    }
}
