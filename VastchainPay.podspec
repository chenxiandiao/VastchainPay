#
# Be sure to run `pod lib lint VastchainPay.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VastchainPay'
  s.version          = '0.1.0'
  s.summary          = 'A short description of VastchainPay.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/chenxiandiao/VastchainPay'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenxiandiao' => '15068808239@163.com' }
  s.source           = { :git => 'git@github.com:chenxiandiao/VastchainPay.git', :tag => s.version.to_s }
#  s.source           = { :git => '/Users/cxd/vastchain/sdk/ios/VastchainPay', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'VastchainPay/Classes/**/*'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
#  s.vendored_libraries = 'VastchainPay/Classes/*.{a}'

  # s.resource_bundles = {
  #   'VastchainPay' => ['VastchainPay/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#   s.frameworks = 'UIKit', 'MapKit'
  s.static_framework = true
  s.dependency 'WechatOpenSDK'
end
