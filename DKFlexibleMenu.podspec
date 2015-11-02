#
# Be sure to run `pod lib lint DKFlexibleMenu.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DKFlexibleMenu"
  s.version          = "0.1.0"
  s.summary          = "A hexagon popup menu showing around touch point."
  s.description      = <<-DESC
                          A flexible menu which displays several hexagon menu items around the touch point.
                          It will calculate whether each menu item is visible and show them at the proper place.
                       DESC
  s.homepage         = "https://github.com/drinking/DKFlexibleMenu"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "drinking" => "pan49@126.com" }
  s.source           = { :git => "https://github.com/drinking/DKFlexibleMenu.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/crazy_drinking'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'DKFlexibleMenu' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
