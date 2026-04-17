package com.openclaw.go
import android.app.*
import android.content.Intent
import android.os.IBinder
import androidx.core.app.NotificationCompat

class AgentService : Service() {
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val channelId = "agent"
        getSystemService(NotificationManager::class.java)?.createNotificationChannel(
            NotificationChannel(channelId, "Agent", NotificationManager.IMPORTANCE_LOW)
        )
        startForeground(1, NotificationCompat.Builder(this, channelId)
            .setContentTitle("🤖 OpenClaw Active")
            .setContentText("AI running in background")
            .setSmallIcon(android.R.drawable.ic_dialog_info).build())
        return START_STICKY
    }
    override fun onBind(intent: Intent?): IBinder? = null
}
