Pod::Spec.new do |s|
  s.name             = "TFLayoutConstraintsFactory"
  s.version          = "1.0.0"
  s.summary          = "Category to generate views’ constraints"
  s.description      = "Category to help with generation of a view constraints for common problems faced by a programmer while dealing with Auto Layout"
  s.homepage         = "https://github.com/TriforkKRK/TFLayoutConstraintsFactory"
  
  s.license          = { :type => 'Apache v2', :file => 'LICENSE' }
  s.author           = { "Julian Król" => "viperking@poczta.onet.pl" }
  s.source           = { :git => "https://github.com/TriforkKRK/TFLayoutConstraintsFactory.git", :tag => s.version.to_s }

  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'Pod/**/*.{h,m}'
end

