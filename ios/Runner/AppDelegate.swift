import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    var config: [String:String]
    if let infoPlistPath = Bundle.main.url(forResource: "Secrets", withExtension: "plist") {
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            if let dict = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String: String] {
                config = dict
                GMSServices.provideAPIKey(config["GOOGLE_API_KEY"]!)
            }
//            if let dict = try PropertyListSerialization.propertyList(from: infoPlistPath, options: [], format: nil) as? [String:String] {
//                config = dict
//                GMSServices.provideAPIKey(config["GOOGLE_API_KEY"])
//            }
        } catch {
            print(error)
        }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
