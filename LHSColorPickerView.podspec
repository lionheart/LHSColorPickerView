Pod::Spec.new do |s|
  s.name         = "LHSColorPickerView"
  s.version      = "1.0.0"
  s.summary      = "A simple and elegant color picker to add to your applications."
  s.homepage     = "http://lionheartsw.com"
  s.license      = 'Apache 2.0'
  s.author       = { "Eric Olszewski" => "eric@lionheartsw.com" }
  s.social_media_url = "http://twitter.com/eric_olszewski"
  s.source       = { :git => "https://github.com/lionheart/LHSColorPickerView.git", :tag => "#{s.version}" }
  s.source_files = 'LHSColorPickerView/*.{h,m}'
  s.public_header_files = 'LHSColorPickerView/*.h'
  s.requires_arc = true
  s.dependency 'LHSCategoryCollection'

  s.platform     = :ios, '7.0'
  s.framework  = 'UIKit'
  s.requires_arc = true
end

