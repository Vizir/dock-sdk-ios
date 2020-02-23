Pod::Spec.new do |s|
  s.name         = "M2YCDT"
  s.version      = "1.1.0"
  s.summary      = "DOCK SDK for iOS Apps"

  s.license      = { :type => "MIT", :file => "LICENSE.txt" }

  s.author             = { "Antonio Anderson Souza" => "antonio@vizir.com.br" }
  s.social_media_url   = "https://www.facebook.com/VizirSoftwareStudio/"
  s.homepage   = "http://vizir.com.br"

  s.swift_version = '4.2'
  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source       = { :git => "https://antonioams@bitbucket.org/myvizir/dock-sdk-ios.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*"
  s.frameworks = 'Foundation'

  s.dependency   "EVReflection/MoyaRxSwift"
  s.dependency   "SwiftKeychainWrapper"
  s.dependency   "CryptoSwift"
end