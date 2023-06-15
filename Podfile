# Uncomment the next line to define a global platform for your project
$minimum_deployment_target = '14.0'

platform :ios, $minimum_deployment_target

target 'chat-app-ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for chat-app-ios

  # UI
  pod 'SVProgressHUD', '2.2.5'
  pod 'SnapKit', '5.6.0'
  pod 'PanModal', '1.2.7'

  # Networking
  pod 'Moya', '15.0.0'
  pod 'Moya/RxSwift', '15.0.0'
  pod 'ReachabilitySwift'

  # Utilities
  pod 'RxSwift', '6.5.0'
  pod 'RxCocoa', '6.5.0'
  pod "RxGesture", '4.0.4'
  pod 'RxOptional', '5.0.2'
  pod 'RxRealm', '5.0.4'
  pod 'IQKeyboardManager', '6.5.10'
  pod 'RxDataSources', '~> 5.0'
  pod 'SwiftDate', '7.0.0'
  pod 'JWTDecode'
  pod 'R.swift', '7.2.4'
  pod 'Atributika', '4.9.9'

  # Firebase
  pod 'Firebase/Core', '9.6.0'

  # WebImage
  pod 'SDWebImage', '~> 5.0'

  
  # NoSQL DB
  pod 'RealmSwift', '10.32.3'
  
  # Permission
  pod 'PermissionsKit/PhotoLibraryPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'


  target 'chat-app-iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'chat-app-iosUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = $minimum_deployment_target
    end
    
    # fix Code signing issues in Xcode 14
    # Xcode 13 used to automatically set CODE_SIGNING_ALLOWED to NO by default for resource bundles.
    # But that's no longer the case in Xcode 14.
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
        config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end

  end
end
