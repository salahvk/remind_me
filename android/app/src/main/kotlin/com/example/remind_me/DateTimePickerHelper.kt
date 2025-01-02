package com.example.remind_me
import android.app.DatePickerDialog
import android.content.Context
import android.graphics.Color
import android.widget.Toast
import android.view.Gravity
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat
import java.text.SimpleDateFormat
import java.util.*

class DatePickerHelper(private val context: Context) {

    private val calendar = Calendar.getInstance()

    fun showDatePicker(onDateSelected: (String) -> Unit) {
        val datePickerDialog = DatePickerDialog(
            context, R.style.CustomDatePickerDialogStyle,
            { _, year: Int, monthOfYear: Int, dayOfMonth: Int ->
                // Format the selected date
                val selectedDate = Calendar.getInstance()
                selectedDate.set(year, monthOfYear, dayOfMonth)
                val dateFormat = SimpleDateFormat("dd/MM/yyyy", Locale.getDefault())
                val formattedDate = dateFormat.format(selectedDate.time)

                // Return the selected date
                onDateSelected(formattedDate)

                // Show the Toast with a slight fade-in effect
                showToast("Selected Date: $formattedDate")
            },
            calendar.get(Calendar.YEAR),
            calendar.get(Calendar.MONTH),
            calendar.get(Calendar.DAY_OF_MONTH)
        )

        // Customize the UI further (Optional)
        datePickerDialog.datePicker.setBackgroundColor(Color.WHITE)
        datePickerDialog.show()
    }

    private fun showToast(message: String) {
        val toast = Toast.makeText(context, message, Toast.LENGTH_SHORT)
        toast.setGravity(Gravity.CENTER, 0, 0)
        
        // Create custom layout for the Toast
        val layout = LinearLayout(context)
        layout.orientation = LinearLayout.HORIZONTAL
        layout.setBackgroundColor(ContextCompat.getColor(context, android.R.color.holo_blue_dark))

        val textView = TextView(context)
        textView.text = message
        textView.setTextColor(Color.WHITE)
        textView.setPadding(20, 20, 20, 20)
        layout.addView(textView)

        toast.view = layout
        toast.show()
    }
}
