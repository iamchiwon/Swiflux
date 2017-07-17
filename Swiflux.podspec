#
# Be sure to run `pod lib lint Swiflux.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Swiflux'
  s.version          = '0.2.1'
  s.summary          = 'Minimal flux library for swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Minimal flux library for swift
                       DESC

  s.homepage         = 'https://github.com/iamchiwon/Swiflux'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iamchiwon' => 'iamchiwon@gmail.com' }
  s.source           = { :git => 'https://github.com/iamchiwon/Swiflux.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Swiflux/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Swiflux' => ['Swiflux/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift'
end
