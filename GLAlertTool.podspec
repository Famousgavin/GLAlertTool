Pod::Spec.new do |s|

  s.name          = "GLAlertTool"
  s.version       = "1.0.1"
  s.summary       = "MBProgressHUD和UIAlertController的简易封装，支持多语言。"

  s.homepage      = "https://github.com/Gavin-ldh/GLAlertTool"
  s.license       = "MIT"
  s.author        = { "Gavin" => "gavin.ldh@hotmail.com" }
  s.social_media_url = "https://www.dhlee.cn"
  s.platform      = :ios, '9.0'
  s.ios.deployment_target = "9.0"
  s.source        = { :git => "https://github.com/Gavin-ldh/GLAlertTool.git", :tag => s.version.to_s }
  s.source_files  = "GLAlertTool/*.{h,m}"
  s.resources     = "GLAlertTool/Resource/*.{bundle,strings}"
  s.framework     = "UIKit", "Foundation"
  s.requires_arc  = true

  s.dependency "GLLanguageTool"
  s.dependency "MBProgressHUD"


end
