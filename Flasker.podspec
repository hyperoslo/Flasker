Pod::Spec.new do |s|
  s.name             = "Flasker"
  s.summary          = "User defaults made secured"
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/Flasker"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/hyperoslo/Flasker.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.source_files = 'Sources/**/*'

  s.dependency 'Arcane'
end
