#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_get_app_group_directory.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_get_app_group_directory'
  s.version          = '1.1.0'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_get_app_group_directory/Sources/flutter_get_app_group_directory/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.resource_bundles = {'flutter_get_app_group_directory_privacy' => ['flutter_get_app_group_directory/Sources/flutter_get_app_group_directory/PrivacyInfo.xcprivacy']}
end
