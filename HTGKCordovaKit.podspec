#
# Be sure to run `pod lib lint HTGKCordovaKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HTGKCordovaKit'
  s.version          = '0.8.0'
  s.summary          = 'HTGKCordovaKit is a basic framework for Cordova.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HTGKCordovaKit 只是封装了Cordova最基础的功能，集成了Cordova官网提供的基础插件。
使用的是WKWebView框架，最低版本支持iOS9.0
DESC

  s.homepage         = 'https://github.com/YUJINHAI2015/HTGKCordovaKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'YUJINHAI2015' => '15088132368@163.com' }
  s.source           = { :git => 'https://github.com/YUJINHAI2015/HTGKCordovaKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # 最新版本的Cordova只能兼容9.0
  s.ios.deployment_target = '9.0'

  s.source_files = 'HTGKCordovaKit/Classes/**/*'

  s.swift_version = '5.0'

  # s.resource_bundles = {
  #   'HTGKCordovaKit' => ['HTGKCordovaKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

    s.dependency 'Cordova', '~>4.5.4'
    # cordova 插件
    # s.dependency 'CordovaPlugin-battery-status', '~>0.2.10'
    # s.dependency 'CordovaPlugin-media'#, '~>0.2.4'
    s.dependency 'cordova-plugin-camera', '~>2.3.0'
    s.dependency 'cordova-plugin-contacts', '~>2.2.0'
    s.dependency 'cordova-plugin-device', '~>1.1.3'
    s.dependency 'cordova-plugin-device-motion', '~>1.2.2'
    s.dependency 'cordova-plugin-device-orientation', '~>1.0.4'
    s.dependency 'cordova-plugin-dialogs', '~>1.2.0'
    s.dependency 'cordova-plugin-file', '~>4.3.0'
    s.dependency 'cordova-plugin-file-transfer', '~>1.6.0'
    s.dependency 'cordova-plugin-geolocation', '~>2.4.0'
    s.dependency 'cordova-plugin-globalization', '~>1.0.4'
    s.dependency 'cordova-plugin-inappbrowser', '~>1.5.0'
    s.dependency 'cordova-plugin-network-information', '~>1.3.0'
    s.dependency 'cordova-plugin-vibration', '~>2.1.2'
    #s.dependency 'cordova-plugin-wkwebview-engine'


end
