# LZZConsole


## Introduction

A console that can be opened in the app (Set up by only one line of code)



## Installation

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'LZZConsole', '~> 0.0.2'
end
```



## Usage

use [LZZConsole shareConsole].enable = YES;  to set up in method appdelegate didFinishLaunchingWithOptions

then shake it out in app any page!!!

#### One Line Set Up 

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // It is recommended to use only once
    [LZZConsole shareConsole].enable = YES;
    return YES;
}
```

#### 