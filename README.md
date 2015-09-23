# Swift Parse Demo 
Demo application build using Swift 2, Xcode 7, iOS 9 having Parse as backend.

## Overview
Swift based mobile application that use <a href="http://www.parse.com" target="_blank" rel="nofollow" >www.parse.com</a> platform as a backend data storage. This is full working application you can use as a base for any ``Parse`` + ``Swift`` based project and expand it. It's free for personal or commercial use.

**It consist below functionality"**
+ Home Screen
+ Parse - User Registration
+ Parse - User Login
+ Parse - Password Reset
+ Parse - Logout

![ScreenShot iPhone4](../master/Screenshots/main-1t.png)
![ScreenShot iPhone4](../master/Screenshots/main-2t.png)

## Platform
+ Swift 2
+ Xcode 7
+ iOS 9
+ Parse.com (for backend storage)

##Supported Device
iPhone 4s, 5, 5s, 5c, 6, 6 Plus, 6s, 6s Plus, all iPad having iOS 9

## Technology used
+ Parse API
+ Simple interface.
+ Build with Xcode storyboard.
+ Adaptive layout for major screen size support.
+ Build with Swift 2, Xcode 7, iOS 9, and Parse integration.

## How To Use
+ Register with <a href="http://www.parse.com" target="_blank" rel="nofollow" >www.parse.com</a>
+ Create application within your parse account having name ``SwiftParseDemo`` etc.
+ Collect application_id & client_key for your parse application.
+ Open ``AppDelegate.swift`` file and replace ``APPLICATION_ID`` and ``CLIENT_KEY`` value. 

<pre>
// Initialize Parse.
let APPLICATION_ID : String = "YOUR-PARSE-APPLICATION-ID"
let CLIENT_KEY  : String = "YOUR-PARSE-APPLICATION-CLIENT-KEY"
</pre>

**Note:** Please remember to change application_id and client_key that belongs to your parse application, otherwise you can't see the data within your parse account.

## Parse Help
+ Parse Registration: <a href="http://www.parse.com" target="_blank" rel="nofollow" >www.parse.com</a>
+ Parse + Swift Integration Guide: <a href="https://www.parse.com/apps/quickstart#parse_data/mobile/ios/swift/existing" target="_blank" rel="nofollow" >Click to visit</a>
+ Parse Documentation: <a href="https://www.parse.com/docs" target="_blank" rel="nofollow" >Click to visit</a>

## Screenshots

**iPhone 4s**

![ScreenShot iPhone4](../master/Screenshots/main-1t.png)
![ScreenShot iPhone4](../master/Screenshots/main-2t.png)

![ScreenShot iPhone4](../master/Screenshots/main-3t.png)
![ScreenShot iPhone4](../master/Screenshots/main-4t.png)

## License
SwiftParseDemo is available under the MIT license. See the LICENSE file for more info.

## Legacy Version
Xcode 6, iOS 8.4 based source code moved to Source-Xcode6 folder. Please note that Xcode 6 based source code are deprecated and not upto date. I will suggest to use latest Xcode 7 based source from ``SwiftParseDemo`` folder at root.
