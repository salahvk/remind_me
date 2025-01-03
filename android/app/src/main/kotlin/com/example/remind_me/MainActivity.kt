package com.example.remind_me

import NotificationScheduler
import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

        private val NOTIFICATION_CHANNEL = "remind_me_android/notificationChannel"
        private val DATE_TIME_CHANNEL = "remind_me_android/dateTimeChannel"
        private val MARK_AS_DONE_EVENT_CHANNEL = "remind_me_android/notificationMarkAsDoneChannel"

        private lateinit var markAsDoneReceiver: MarkAsDoneReceiver

        override fun onStart() {
                super.onStart()

                // Register the receiver

        }

        override fun onStop() {
                super.onStop()

                // Unregister receiver when no longer needed
                unregisterReceiver(markAsDoneReceiver)
        }

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
                super.configureFlutterEngine(flutterEngine)
                requestNotificationPermission()

                GeneratedPluginRegistrant.registerWith(flutterEngine)
                markAsDoneReceiver = MarkAsDoneReceiver()
                MarkAsDoneReceiver.flutterEngine = flutterEngine

                // Set up the EventChannel
                val channel = EventChannel(flutterEngine.dartExecutor, MARK_AS_DONE_EVENT_CHANNEL)
                channel.setStreamHandler(
                        object : EventChannel.StreamHandler {
                                override fun onListen(
                                        arguments: Any?,
                                        events: EventChannel.EventSink?
                                ) {
                                        // Handle stream listener
                                        println("Listening to Mark as Done events")
                                        markAsDoneReceiver.setEventSink(events!!)
                                        markAsDoneReceiver.onReceive(context, intent)
                                }

                                override fun onCancel(arguments: Any?) {
                                        // Handle stream cancellation
                                }
                        }
                )

                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, NOTIFICATION_CHANNEL)
                        .setMethodCallHandler { call, result ->
                                if (call.method == "scheduleNotification") {
                                        val notificationScheduler = NotificationScheduler(this)
                                        val taskId = call.argument<String>("taskId")!!
                                        val title = call.argument<String>("title")
                                        val description = call.argument<String>("description")
                                        val timeMillis = call.argument<Long>("timeMillis")

                                        println("Task ID: $taskId")
                                        notificationScheduler.scheduleNotification(
                                                taskId,
                                                title!!,
                                                description!!,
                                                timeMillis!!
                                        )
                                        result.success(null)
                                }
                        }

                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DATE_TIME_CHANNEL)
                        .setMethodCallHandler { call, result ->
                                if (call.method == "showDatePicker") {
                                        val datePickerHelper = DatePickerHelper(this)
                                        datePickerHelper.showDatePicker { selectedDate ->
                                                result.success(selectedDate)
                                        }
                                } else if (call.method == "showTimePicker") {
                                        val datePickerHelper = DatePickerHelper(this)
                                        datePickerHelper.showTimePicker { selectedTime ->
                                                result.success(selectedTime)
                                        }
                                }
                        }
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
                if (requestCode == 101) {
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
