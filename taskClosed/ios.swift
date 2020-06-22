import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  var endPoint:String = "http://URL"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func applicationWillTerminate(_ application: UIApplication) {
        guard let url = URL(string: "\(self.endPoint)/IOSTaskClosed") else{return}
        var res:String
        do{
            res = try String(contentsOf: url)
            print(res)
        }
        catch{
            print("CALL")
        }
        print("APP CLOSED")
    }
    override func applicationDidEnterBackground(_ application: UIApplication) {
        guard let url = URL(string: "\(self.endPoint)/IOSDIDENTER") else{return}
        var res:String
        do{
            res = try String(contentsOf: url)
            print(res)
        }
        catch{
            print("CALL")
        }
        print("APP CLOSED")
    } 
}
    
