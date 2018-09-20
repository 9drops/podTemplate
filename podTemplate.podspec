Pod::Spec.new do |s|
  s.name         = "podTemplate"
  s.version      = "1.0.0"
  s.summary      = "Log tools, for term print and local file log or remote log"
  s.description  = <<-DESC
                    Log tools, for term print and local file log or remote log. Encapsulate from CocoaLumberjack
                   DESC
  s.homepage     = "http://www.icodingprogram.com"
  s.license = { :type => 'MIT', :text => <<-LICENSE
            Copyright up366 2018-2020
                       LICENSE
                              }
  s.author       = { "9drops" => "zhanbz@gmail.com" }
  s.source       = { :git => "http://192.168.0.34/iOSGroup/#{s.name}.git", :tag => "#{s.version}" }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  
   s.resource_bundles = {
      "#{s.name}" => ["#{s.name}/Assets/*.{png,xib,plist}"]
  }
  
  #s.module_map   = "#{s.name}/Classes/CommonCrypto/module.modulemap" 
  #如果自己已经打包好bundle
  #s.resources = "#{s.name}/Assets/*.bundle"
  s.dependency "CocoaLumberjack", "~> 2.0.0"
  
  if ENV["#{s.name}_lib"] || ENV["all_lib"]
    s.source_files = "#{s.name}/Classes/#{s.name}.h" , "#{s.name}/Classes/**/*.h"
    s.vendored_frameworks = "#{s.name}/Products/#{s.name}.framework"
    s.prepare_command = "/bin/sh  build_framework.sh #{s.name}"
  else
    s.source_files = "#{s.name}/Classes/*.{m,h,c}", "#{s.name}/Classes/**/*.{m,h,c}", "#{s.name}/Classes/**/**/*.{m,h,c}"
    s.public_header_files = "#{s.name}/Classes/#{s.name}.h", "#{s.name}/Classes/**/*.h"
  end
  
end