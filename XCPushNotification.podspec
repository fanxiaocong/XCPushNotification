
Pod::Spec.new do |s|
  s.name             = 'XCPushNotification'
  s.version          = '1.1.1'
  s.summary          = 'XCPushNotification封装第三方推送功能，目前已经集成了 JPush 推送'

  s.description      = <<-DESC
XCPushNotification封装第三方推送功能，目前已经集成了 JPush 推送，使用方便
                       DESC

  s.homepage         = 'https://github.com/fanxiaocong/XCPushNotification'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaocong' => '1016697223@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaocong/XCPushNotification.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.3'
  
  s.subspec 'XCPushNotification' do |mgr|
      mgr.source_files = 'XCPushNotification/Classes/XCPushNotification/*.{h,m}',
                         'XCPushNotification/Classes/XCPushNotification/XCPushNotificationProtocol/*.{h,m}'
  end
  
  s.static_framework = true
  s.subspec 'JPushNotification' do |jpush|
      jpush.source_files = 'XCPushNotification/Classes/JPushNotification/*.{h,m}'
      jpush.dependency 'XCPushNotification/XCPushNotification'
      jpush.dependency 'XCMacros'
      jpush.dependency 'JPush', '~> 3.0.6'
      jpush.xcconfig = {
          'VALID_ARCHS' => 'arm64 x86_64'
      }
  end


# 测试
# 测试
# 测试
=begin
    s.subspec 'JPushNotification' do |jpush|
        jpush.source_files = 'XCPushNotification/Classes/JPushNotification/*.{h,m}',
                             'XCPushNotification/Classes/JPushNotification/JPushSDK/*.{h}'
        jpush.vendored_libraries = 'XCPushNotification/Classes/JPushNotification/JPushSDK/*.a'

        jpush.dependency 'XCPushNotification/XCPushNotification'
        jpush.dependency 'XCMacros'

        jpush.frameworks = [
            'CFNetwork',
            'CoreFoundation',
            'CoreTelephony',
            'SystemConfiguration',
            'CoreGraphics',
            'Security',
            'UserNotifications',
            'Foundation',
            'UIKit'
        ]

        jpush.libraries = [
            'z',
            'resolv'
        ]

        jpush.xcconfig = {
            'VALID_ARCHS' => 'armv7 armv7s arm64 x86_64
        }
    end
=end

# 测试
# 测试
# 测试



end
