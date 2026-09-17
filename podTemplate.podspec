Pod::Spec.new do |s|
  s.name         = "podTemplate"
  s.version      = "1.0.0"
  s.summary      = "Log tools, for term print and local file log or remote log"
  s.description  = <<-DESC
                    Log tools, for term print and local file log or remote log. Encapsulate from CocoaLumberjack
                   DESC
  s.homepage     = "https://github.com/9drops"
  s.license = { :type => 'MIT', :text => <<-LICENSE
            Copyright 9drops 2026-2028
                       LICENSE
                              }
  s.author       = { "9drops" => "zhanbz@gmail.com" }
  s.source       = { :git => "git@github.com:9drops/#{s.name}.git", :tag => "#{s.version}" }
  s.platform     = :ios, "12.0"
  s.requires_arc = true
  
  s.source_files = "#{s.name}/Classes/**/*.{m,h,c}"
  s.public_header_files = "#{s.name}/Classes/**/*.h"
end
