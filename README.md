# LZZConsole


## Introduction

LZZConsole is a powerful and easy-to-use console solution designed for iOS applications. With just a single line of code, you can integrate a fully functional console into your app, enabling quick debugging and testing on any page.



## Installation

To install LZZConsole, simply add the following code to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'YourTargetName' do
  pod 'LZZConsole', '~> 0.0.3'
end
```



## Usage

Integrate LZZConsole into your app with ease:



```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Enable the console with a single line of code
    [LZZConsole shareConsole].enable = YES;
    return YES;
}
```

Once enabled, you can access the console by shaking your device on any page within the app.
#### One Line Set Up 
LZZConsole offers a truly seamless setup experience. With just one line of code, you can have a fully functional console ready to use in your application. This streamlined approach allows you to focus more on development and less on configuration.
Feel free to adjust the content to better match your project's specific features and requirements. If you have any further questions or need additional assistance, don't hesitate to ask.
