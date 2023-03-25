import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDpfS1oRGreGSBU5HHjMmQ3o5NLw7VdJ6I")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
