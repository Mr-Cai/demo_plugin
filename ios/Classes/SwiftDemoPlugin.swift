import Flutter
import UIKit

public class SwiftDemoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "demo_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftDemoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method.elementsEqual("nativeToast")) {
            let args = call.arguments as? NSDictionary
            let msg = args!["msg"] as? String
            UIAlertView(title:"", message:msg, delegate:nil, cancelButtonTitle:"OK")
        }
        result("iOS " + UIDevice.current.systemVersion) 
    }
}
