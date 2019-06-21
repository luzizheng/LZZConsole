
Pod::Spec.new do |spec|


  spec.name         = "LZZConsole"
  spec.version      = "0.0.1"
  spec.summary      = "App Console"

  spec.description  = <<-DESC
  Features:
  1.UIView utils
  2.Toos
  3.others ... 

  DESC
  spec.homepage     = "https://github.com/luzizheng/LZZConsole"


  spec.license      = "Apache License 2.0"


  spec.author             = { "Frank Lu" => "arloou@gmail.com" }


  spec.platform     = :ios
  spec.platform     = :ios, "8.0"



  spec.source       = { :git => "https://github.com/luzizheng/LZZConsole.git", :tag => spec.version }


  spec.source_files  = "Classes", "LZZConsoleDemo/LZZConsoleDemo/LZZConsole/*.{h,m}"


  spec.public_header_files = "LZZConsoleDemo/LZZConsoleDemo/LZZConsole/LZZConsole.h"




  spec.requires_arc = true


end
