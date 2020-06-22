
class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        startService( Intent(this, ExitService::class.java) )
        super.onCreate(savedInstanceState)
    }
}
