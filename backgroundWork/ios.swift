// XCODE

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  var endPoint:String = "http://URL"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let callChannel = FlutterMethodChannel.init(
            name: "samples.flutter.dev/action",
            binaryMessenger: controller.binaryMessenger
        )
        callChannel.setMethodCallHandler { (call, result) in
            if(call.method == "backgroundServiceFunc"){
                self.backThread()
            }
            return
        }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  func backThread(){
        print("START")
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = URL(string: "\(self.endPoint)/BackThread") else{return}
            var res:String
            do{
                res = try String(contentsOf: url)
                print(res)
            }
            catch{
                print("CALL")
            }
            
            print("Back Thread")
        }
    }
    
      
}
    
