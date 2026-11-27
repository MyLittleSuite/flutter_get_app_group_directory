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

  s.resource_bundles = {'flutter_get_app_group_directory_privacy' => ['flutter_get_app_group_directory/Sources/flutter_get_app_group_directory/PrivacyInfo.xcprivacy']}

  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.15'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
