// Service onTaskRemove & AsyncTask HTTP(GET)

// * manifest

// <service
//            android:name=".ExitService"
//            android:enabled="true"
//            android:exported="false"
//            android:stopWithTask="false" />

// * service.kt

class ExitService : Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null
    }
    override fun onTaskRemoved(rootIntent: Intent?) {
        GetWeatherTask().execute().get()
        super.onTaskRemoved(rootIntent)
        this.stopSelf()
    }
    class GetWeatherTask() : AsyncTask<Unit, Unit, String>() {

        override fun doInBackground(vararg params: Unit?): String? {
            URL("http://URL/Flutter App Task(Process) EXIT").readText()
            return null
        }
    }
}

