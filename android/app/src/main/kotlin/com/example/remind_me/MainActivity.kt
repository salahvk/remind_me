package com.example.remind_me

import android.Manifest
import android.app.AlarmManager
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

        private val NCHANNEL = "com.example.taskbuddy/notifications"
        private val DCHANNEL = "com.example.remind_me/datePicker"

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
                super.configureFlutterEngine(flutterEngine)
                requestNotificationPermission()

                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NCHANNEL)
                        .setMethodCallHandler { call, result ->
                                if (call.method == "scheduleNotification") {
                                        val title = call.argument<String>("title")
                                        val description = call.argument<String>("description")
                                        val timeMillis = call.argument<Long>("timeMillis")

                                        scheduleNotification(title!!, description!!, timeMillis!!)
                                        result.success(null)
                                } else if (call.method == "triggerNotification") {
                                        val title = call.argument<String>("title")
                                        val description = call.argument<String>("description")
                                        Log.d("Notification", "Title: $title")
                                        triggerNotification(title!!, description!!)
                                        result.success(null)
                                }
                        }

                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DCHANNEL)
                        .setMethodCallHandler { call, result ->
                                if (call.method == "showDatePicker") {
                                        val datePickerHelper = DatePickerHelper(this)
                                        datePickerHelper.showDatePicker { selectedDate ->
                                                result.success(
                                                        selectedDate
                                                ) // Send the result back to Flutter
                                        }
                                } else if (call.method == "showTimePicker") {
                                        val datePickerHelper = DatePickerHelper(this)
                                        datePickerHelper.showTimePicker { selectedTime ->
                                                result.success(
                                                        selectedTime
                                                ) // Send the result back to FlutterF
                                        }
                                }
                        }
        }

        // Function to schedule notification at a specific time
        private fun scheduleNotification(title: String, description: String, timeMillis: Long) {
                val intent =
                        Intent(applicationContext, NotificationService::class.java).apply {
                                putExtra("title", title)
                                putExtra("description", description)
                        }

                val pendingIntent =
                        PendingIntent.getBroadcast(
                                applicationContext,
                                0,
                                intent,
                                PendingIntent.FLAG_IMMUTABLE
                        )

                val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
                alarmManager.setExact(AlarmManager.RTC_WAKEUP, timeMillis, pendingIntent)
        }

        // New function to trigger a notification immediately
        private fun triggerNotification(title: String, description: String) {
                // Log the received title and description
                Log.d("Notification", "Title: $title")
                Log.d("Notification", "Description: $description")

                val notificationManager =
                        getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
                Log.d("Notification", "NotificationManager obtained")
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) { // Android 13+
                        val permissionCheck =
                                ContextCompat.checkSelfPermission(
                                        this,
                                        Manifest.permission.POST_NOTIFICATIONS
                                )
                        Log.d(
                                "Notification",
                                "POST_NOTIFICATIONS granted: ${permissionCheck == PackageManager.PERMISSION_GRANTED}"
                        )
                }

                // Create notification channel for Android 8.0+
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        Log.d(
                                "Notification",
                                "Android version >= Oreo, creating NotificationChannel"
                        )

                        val channel =
                                NotificationChannel(
                                        "task_channel",
                                        "Task Reminders",
                                        NotificationManager.IMPORTANCE_HIGH
                                )
                        channel.enableVibration(true) // Enable vibration
                        channel.lockscreenVisibility = Notification.VISIBILITY_PUBLIC

                        notificationManager.createNotificationChannel(channel)
                        Log.d("Notification", "NotificationChannel created")
                        val areNotificationsEnabled = notificationManager.areNotificationsEnabled()

                        // Log the result
                        Log.d("Notification", "Are notifications enabled: $areNotificationsEnabled")
                }

                // Build the notification
                Log.d("Notification", "Building Notification")
                // val notification = NotificationCompat.Builder(this, "task_channel")
                //     .setContentTitle(title)
                //     .setContentText(description)
                //     .setSmallIcon(R.drawable.ic_launcher_foreground) // You can replace with your
                // own
                // icon
                //     .setPriority(NotificationCompat.PRIORITY_HIGH)
                //     .setAutoCancel(true)
                //     .build()
                // val fullScreenIntent =
                //         Intent(context, MainActivity::class.java).apply {
                //                 flags =
                //                         Intent.FLAG_ACTIVITY_NEW_TASK or
                //                                 Intent.FLAG_ACTIVITY_CLEAR_TASK
                //         }
                // val fullScreenPendingIntent =
                //         PendingIntent.getActivity(
                //                 context,
                //                 0,
                //                 fullScreenIntent,
                //                 PendingIntent.FLAG_IMMUTABLE
                //         )
                var notification =
                        NotificationCompat.Builder(this, "task_channel")
                                // .setSmallIcon(R.drawable.ic_launcher_foreground)
                                .setContentTitle("My notification")
                                .setContentText("Hello World!")
                                .setPriority(NotificationCompat.PRIORITY_HIGH)
                                .setAutoCancel(true)
                                .build()

                val notificationId = (System.currentTimeMillis() % 10000).toInt()
                notificationManager.notify(notificationId, notification)

                // Log notification details
                Log.d("Notification", "Notification built: $notification")

                // Show the notification immediately
                Log.d("Notification", "Showing notification")
                notificationManager.notify(notificationId, notification)
                Log.d("Notification", "Notification displayed")
        }

        // Function to request notification permission
        private fun requestNotificationPermission() {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) { // Android 13+
                        if (ContextCompat.checkSelfPermission(
                                        this,
                                        Manifest.permission.POST_NOTIFICATIONS
                                ) != PackageManager.PERMISSION_GRANTED
                        ) {
                                // Request permission
                                requestPermissions(
                                        arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                                        101 // Request code
                                )
                        } else {
                                Log.d("Notification", "Permission already granted")
                        }
                } else {
                        Log.d("Notification", "Permission not required for this Android version")
                }
        }

        override fun onRequestPermissionsResult(
                requestCode: Int,
                permissions: Array<out String>,
                grantResults: IntArray
        ) {
                super.onRequestPermissionsResult(requestCode, permissions, grantResults)
                if (requestCode == 101) { // Match the request code
                        if (grantResults.isNotEmpty() &&
                                        grantResults[0] == PackageManager.PERMISSION_GRANTED
                        ) {
                                Log.d("Notification", "Notification permission granted")
                        } else {
                                Log.d("Notification", "Notification permission denied")
                        }
                }
        }
}
