Pod::Spec.new do |spec|

  spec.name         = "SwiftUIList"
  spec.version      = "0.0.1"
  spec.summary      = "A pretty SwiftUI Framework to work with Horizontal and vertical List."

  spec.description  = <<-DESC
This CocoaPods helps you create a Horizontal list or Vertical list with one line of code!
                   DESC

  spec.homepage     = "https://github.com/shimaaNagah95/SwiftUIList.git"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Shimaa Nagah" => "shimaa.nagah@code95.info" }

  spec.ios.deployment_target = "13.0"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/shimaaNagah95/SwiftUIList.git", :tag => "#{spec.version}" }

  spec.source_files  = "SwiftUIList/**/*.{h,m,swift}"
  
end
