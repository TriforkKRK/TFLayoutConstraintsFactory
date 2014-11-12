Pod::Spec.new do |s|
  s.name             = "TFLayoutConstraintsFactory"
  s.version          = "1.0.1"
  s.summary          = "Category to generate views’ constraints"
  s.description      = "Set of methods giving a shorthand while generating NSAutoLayout views' constraints in a common, tedious scenarios."
  s.homepage         = "https://github.com/TriforkKRK/TFLayoutConstraintsFactory"
  
  s.license          = { :type => 'Apache v2', :file => 'LICENSE' }
  s.author           = { "Julian Król" => "viperking@poczta.onet.pl" }
  s.source           = { :git => "https://github.com/TriforkKRK/TFLayoutConstraintsFactory.git", :tag => s.version.to_s }

  s.platform         = :ios, '7.0'
  s.requires_arc     = true
  s.source_files     = 'Pod/**/*.{h,m}'

  s.prefix_header_contents = '#if NSLOG_TO_TFLOGGER_ENABLED', '#import <TFLogger/NSLogVisualFormat.h>', '#define NSLog(...) NSLogToTFLoggerAdapter(@"TFLayoutConstraintsFactory", __VA_ARGS__)', '#endif'
end

