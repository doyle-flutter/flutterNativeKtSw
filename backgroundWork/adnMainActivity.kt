class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    companion object{
        const val CHANNEL = "samples.flutter.dev/action";
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if(call.method == "backgroundServiceFunc"){
                this.flutterbackgroundServiceFunc()
                return@setMethodCallHandler
            }
            return@setMethodCallHandler
        }
    }

    private fun flutterbackgroundServiceFunc():Void? {
        startService(Intent(this, MyIntentService::class.java))
        return null
    }

}
