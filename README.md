# ArticlesApp

## Building And Running The Project (Requirements)
* Swift 5.0+
* Xcode 13.1
* iOS 13.0+

## Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to set up XCode and Swift on your Mac.
- To set up cocoa pods for dependency management, make use of [CocoaPods](https://guides.cocoapods.org/using/getting-started.html#getting-started)

## Setup Configs
- Checkout main branch to run the latest version
- Open the terminal and navigate to the project root directory.
- Make sure you have cocoa pods set up, then run: pod install
- Open the project by double-clicking the `ArticlesApp.xcworkspace` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = ArticlesApp
PRODUCT_BUNDLE_IDENTIFIER = com.ArticlesApp

#targets:
* ArticlesApp
* ArticlesAppTests
* ArticlesAppUITests

```

## Build
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app

## Architecture
This application uses the Model-View-ViewModel (referred to as MVVM) UI architecture.


## Dependencies
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxCocoa](https://github.com/ReactiveX/RxSwift)
* [OHHTTPStubs](https://github.com/AliSoftware/OHHTTPStubs)

