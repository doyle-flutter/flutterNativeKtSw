// IntentService


// * manifest
// <service
//            android:name=".MyIntentService"
//            android:enabled="true"
//            android:exported="true" />


// * service(kt)
class MyIntentService : IntentService("MyIntentService") {
    override fun onHandleIntent(intent: Intent?) {
        timer(period = 2000){
          URL("http://URL/backgroundServiceFunc").readText()
        }
        return
    }
}
