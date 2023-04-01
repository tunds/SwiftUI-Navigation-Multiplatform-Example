# SwiftUI-Navigation-Multiplatform-Example

## Introduction

This repo a 100% SwiftUI app showcasing examples of navigation, Multiplatform support &amp; deep linking using the new NavigationStack &amp; NavigationSplitView API's based of my [course](https://youtube.com/playlist?list=PLvUWi5tdh92wWS3F-AVsCJHkhBlrkBp6f) that that showcases everything you need to know about handling navigation in SwiftUI apps.

## Requirements

* Xcode 14.2+
* Swift 5.7+
* SwiftUI 4.0+
* iOS16.1+

## Preview

| Platform | Preview |
| ----------- | ----------- |
| iPhone |<img src="https://user-images.githubusercontent.com/13179531/229285676-3ace19ae-5e21-4396-8d46-79f43cc0a54d.png" width="500">|
| iPad |<img src="https://user-images.githubusercontent.com/13179531/229285538-51dae19d-a566-486e-9dbb-8ec33284b154.png" width="500">|
| Mac |<img src="https://user-images.githubusercontent.com/13179531/229285590-7c1b5f7d-0c58-413c-83df-79ae00c51841.png" width="500">|

## Features

* Simple & Organised Project structure
* iPhone, iPad & Mac support
* Handling Sheet presentation using [detents](https://developer.apple.com/documentation/swiftui/modal-presentations)
* Examples of handling navigation using [`NavigationStack`](https://developer.apple.com/documentation/swiftui/navigationstack) & [`navigationDestination(for:destination:)`](https://developer.apple.com/documentation/swiftui/view/navigationdestination(for:destination:))
* Handling navigation programatically by building a RouteManager
* Custom URL Scheme Integration for deep links
* How to handle deeplinking in SwiftUI for multiplatform & route to screens
* Firebase integration using SPM 🚨**Replace GoogleService's Plist with your own**🚨
* Push Notification support using FCM [(Firebase Cloud Messaging)](https://firebase.google.com/docs/cloud-messaging/ios/client)
* How to handle push notification deep links
* Adapative iPad & Mac layout for 2 & 3 column layouts
* [`keyboardShortcut(_:)`](https://developer.apple.com/documentation/swiftui/capsule/keyboardshortcut(_:)-1vqvs/) actions to toggle side bar visibility
* Apple Pencil actions using [`onHover`](https://developer.apple.com/documentation/swiftui/path/onhover(perform:)/) for animating hover effects for iPad & Mac
* Unit Tests

## Project Installation

1. Clone the repository using git clone https://github.com/tunds/SwiftUI-Navigation-Multiplatform-Example.git or use Open in Xcode
2. Open the project in Xcode
3. Build and run the app on a simulator or device for either iPhone, iPad or MacOS


## Deep Links Setup Guide (Custom URL Schemes)

In order get deep links working in the sample project you could either use the default stock app on the device, terminal or a handy tool like [RocketSim](https://www.rocketsim.app). You can check out this chapter in my video to learn more about testing deep links on a device [here](https://youtu.be/KevGhZQRcG8?t=283).

Below is a table of all the current deeplinks the application handles routing for and will navigate to.

| Name        | Example | Purpose | Condition |
| ----------- | ----------- | ----------- | ----------- |
| Invalid Product | myfoodapp://product?item=xxxx | Handles showing an invalid product screen for when the app can't find a product with the specified id. | For the item key query parameter add in an invalid product id |
| Open Item | myfoodapp://product?item=🍦_Ice+Cream | Handles showing a product that has been defined, in the dummy data model. | For the item key query parameter the id is a combination of the title and name, all the valid ids can be found in `Food.swift` and it's normally a combination of `<emoji>_<title>`. Any spaces are replaced with a +.  |
| Promo | myfoodapp://promo?discount=0.3&desc=enjoy+this+discount | Handles showing a promotion to the user. | For the discount key query parameter the value should be a decimal represented in a string representation and the desc key has a value of a string, any space should be replaced with a + |
| Open App | myfoodapp://menu | Opens up the app | There are no query parameters for this since this just opens up the app using a generic url scheme  |

## Push Notification Setup Guide (FCM)

This project uses [FCM](https://firebase.google.com/docs/cloud-messaging/ios/client) for handling push notifications. This project already has Firebase added as a Swift Package. But you will need to replace the GoogleServices plist file with your own if you plan to connect this to your own Firebase project. A guide on this can be seen [here](https://youtu.be/l-iN0kY_bmg).

Once you do this you can then setup your firebase project by uploading either an APNS Key or Certificates. You can learn more about this [here](https://youtu.be/msWb_Iyscro?t=2851).

The code for push notification deep links is reusing code and the same deep links defined in the table in [Deep Links Setup Guide (Custom URL Schemes)](#deep-links-setup-guide-(custom-url-schemes)). In order to send a deep link in firebase make sure the key you use is `link` and you copy one of the deeplinks defined above.

## Credits

This demo app was created me [tundsdev](https://www.youtube.com/channel/UC7AuV86ZjR3YaEdb5USNvWQ). And is part of a course which you can view in an playlist on my channel [here](https://youtube.com/playlist?list=PLvUWi5tdh92wWS3F-AVsCJHkhBlrkBp6f). This playlist essentially breaks down all the code that exists in this playlist and everything you need to know. I would also highly recommend you check out these videos to learn more about my thought process and reasoning. Below are links to each video in this course which builds up this project. 

* [**Become A SwiftUI Navigation Pro (Navigation Course)**](https://youtube.com/playlist?list=PLvUWi5tdh92wWS3F-AVsCJHkhBlrkBp6f)
* [**Unlock the Secrets of SwiftUI NavigationStack: A Beginners Guide 🔐**](https://youtu.be/cik3doGHZiI)
* [**Discover Programmatic Navigation in SwiftUI 🌍  | SwiftUI NavigationStack Tutorial**](https://youtu.be/GpjTeGPgIs8)
* [**Learn How To Easily Create Deep Links in SwiftUI 🔗**](https://youtu.be/KevGhZQRcG8)
* [**The Absolute Beginner's Guide to iOS Firebase Push Notifications ⚡️**](https://youtu.be/msWb_Iyscro)
* [**SwiftUI Multiplatform Magic 🪄: Your First Multiplatform App using NavigationSplitView**](https://youtu.be/v7rRbiDprIg)


## Credits

If you're interested in following me you can find me on:

* [YouTube](https://www.youtube.com/channel/UC7AuV86ZjR3YaEdb5USNvWQ)
* [Twitter](https://twitter.com/tundsdev)
* [Mastodon](https://iosdev.space/@tundsdev)
* [Website](https://tunds.dev)

I also have a [Kofi](https://ko-fi.com/tundsdev) where you can donate and buy me a coffee if you found this useful also.
