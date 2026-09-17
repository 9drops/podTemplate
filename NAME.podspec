Pod::Spec.new do |s|
  s.name             = "${POD_NAME}"
  s.version          = "1.0.0"
  s.summary          = "A short description of ${POD_NAME}."

  s.description  = <<-DESC
                    TODO: Add long description of the pod here.
                   DESC
  s.homepage     = "https://github.com/9drops"
  s.license = { :type => 'MIT', :text => <<-LICENSE
            Copyright 9drops 2026-2028
                       LICENSE
  }
  
  s.author       = { "${USER_NAME}" => "${USER_EMAIL}" }
  s.source       = { :git => "git@github.com:9drops/#{s.name}.git", :tag => "#{s.version}" }
  s.platform     = :ios, "10.0"
  s.requires_arc = true
  
  s.source_files = "#{s.name}/Classes/**/*.{m,h,c}"
  s.public_header_files = "#{s.name}/Classes/**/*.h"
  
end
