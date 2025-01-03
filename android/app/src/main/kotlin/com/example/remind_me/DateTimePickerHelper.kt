package com.example.remind_me

import android.app.DatePickerDialog
import android.app.TimePickerDialog
import android.content.Context
import java.text.SimpleDateFormat
import java.util.*

class DatePickerHelper(private val context: Context) {

    private val calendar = Calendar.getInstance()

    fun showDatePicker(onDateSelected: (String) -> Unit) {
        println("Showing DatePickerDialog...")
        val datePickerDialog =
                DatePickerDialog(
                        context,
                        R.style.CustomDatePickerDialogStyle,
                        { _, year: Int, monthOfYear: Int, dayOfMonth: Int ->
                            // Format the selected date
                            println("Date listener")

                            calendar.set(year, monthOfYear, dayOfMonth)
                            val dateFormat = SimpleDateFormat("dd/MM/yyyy", Locale.getDefault())
                            val formattedDate = dateFormat.format(calendar.time)

                            // Return the selected date
                            onDateSelected(formattedDate)

                            // Show the Toast with a slight fade-in effect
                            println("Selected Date: $formattedDate")
                        },
                        calendar.get(Calendar.YEAR),
                        calendar.get(Calendar.MONTH),
                        calendar.get(Calendar.DAY_OF_MONTH)
                )
        println("DatePickerDialog shown")
        // Customize the UI further (Optional)
        datePickerDialog.show()

        datePickerDialog.setOnDismissListener { println("DatePickerDialog dismissed") }

        // datePickerDialog.show()
        // val dialogWindow = datePickerDialog.window
        // dialogWindow?.setBackgroundDrawableResource(android.R.color.transparent)
    }

    fun showTimePicker(onTimeSelected: (String) -> Unit) {
        println("Showing TimePickerDialog...")

        // Get the current time
        val currentHour = calendar.get(Calendar.HOUR_OF_DAY)
        val currentMinute = calendar.get(Calendar.MINUTE)

        // Create a TimePickerDialog with the custom style
        val timePickerDialog =
                TimePickerDialog(
                        context,
                        R.style.CustomTimePickerDialogStyle, // Apply the custom style
                        { _, hourOfDay: Int, minute: Int ->
                            println("Time listener")

                            // Format the selected time
                            val formattedTime = String.format("%02d:%02d", hourOfDay, minute)

                            // Return the selected time
                            onTimeSelected(formattedTime)

                            // Show a Toast
                            println("Selected Time: $formattedTime")
                        },
                        currentHour,
                        currentMinute,
                        true // Use 24-hour format
                )

        println("TimePickerDialog shown")

        // Show the dialog
        timePickerDialog.show()

        // Optional: Handle dismiss event
        timePickerDialog.setOnDismissListener { println("TimePickerDialog dismissed") }
    }
}
