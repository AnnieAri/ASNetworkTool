#
# Be sure to run `pod lib lint ASNetworkTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ASNetworkTool'
  s.version          = '30'
  s.summary          = '网络请求解析框架'
  s.swift_version = '4.2'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HandyJSON+Moya+Alamofire 封装的网络请求解析框架
                       DESC

  s.homepage         = 'https://github.com/AnnieAri/ASNetworkTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '18354295998@sina.cn' => '6937523@qq.com' }
  s.source           = { :git => 'https://github.com/AnnieAri/ASNetworkTool.git', :tag => s.version.to_s }
  s.source_files = 'Core/*.swift'
  s.ios.deployment_target = '9.0'
  # s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }

  s.dependency 'Moya'
  s.dependency 'HandyJSON'
end
