Pod::Spec.new do |s|
  s.name             = "ABKit"
  s.version          = "0.1.0"
  s.summary          = "AB testing framework for iOS"
  s.description      = <<-DESC
                       AB testing framework for iOS
                       DESC
  s.homepage         = "https://github.com/recruit-mp/ABKit"
  s.license          = "MIT"
  s.author           = { "Naoto Kaneko" => "n_kaneko@r.recruit.co.jp" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/ABKit.git", :tag => s.version.to_s }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.source_files     = "Pod/Classes/**/*"
end
