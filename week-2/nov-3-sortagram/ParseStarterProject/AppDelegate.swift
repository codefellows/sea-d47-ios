/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit

import Parse

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.setupParse()
        return true
    }
    
    func setupParse() {
        Parse.setApplicationId("aXIaZVYCpM4cXIzibjhpOhPU90CECm8wAdifsYpG", clientKey: "997EfcHfmQ9HVIJrHD96dUVIoIVYsLVoAv838qk2")
    }
}
