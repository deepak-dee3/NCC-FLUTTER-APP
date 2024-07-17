import UIKit
import Flutter
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
     GeneratedPluginRegistrant.register(with: registry)
    }
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    



 // Hide your app’s key window when your app will resign active.
 — (void)applicationWillResignActive:(UIApplication *)application {
   self.window.hidden = YES;
 }
 // Show your app’s key window when your app becomes active again.
 — (void)applicationDidBecomeActive:(UIApplication *)application {
   self.window.hidden = NO;
 }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
