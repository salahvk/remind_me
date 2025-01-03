import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import com.example.remind_me.NotificationService

class NotificationScheduler(private val context: Context) {

    fun scheduleNotification(taskId: String, title: String, description: String, timeMillis: Long) {
        val intent =
                Intent(context, NotificationService::class.java).apply {
                    putExtra("taskId", taskId)
                    putExtra("title", title)
                    putExtra("description", description)
                }

        val pendingIntent =
                PendingIntent.getBroadcast(context, 0, intent, PendingIntent.FLAG_IMMUTABLE)

        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarmManager.setExact(AlarmManager.RTC_WAKEUP, timeMillis, pendingIntent)
    }
}
