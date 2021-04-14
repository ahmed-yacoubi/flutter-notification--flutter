// Copyright 2018, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var flutterResult: FlutterResult?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let pushManager = PushNotificationManager(userID: "currently_logged_in_user_id")
     pushManager.registerForPushNotifications()
     
     FirebaseApp.configure()

    let controllor : FlutterViewController = window?.rootViewController as! FlutterViewController
    let CHANNEL = FlutterMethodChannel(name: "com.ahmed.channel/ios", binaryMessenger: controllor as! FlutterBinaryMessenger)
    CHANNEL.setMethodCallHandler({
        [unowned self]
        (methodCall,result ) in
            if methodCall.method == "iosMethod"
            {
                
                result("hello")
            }
        
        
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
 
}
