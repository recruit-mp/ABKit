Pod::Spec.new do |s|
  s.name             = "ABKit"
f s.version          = "0.2.0"
  s.summary          = "AB testing framework for iOS"
  s.description      = <<-DESC
                       ABKit is a library for implementing a simple Split Test that:
                       * Doesn't require an HTTP client
                       * written in Pure Swift
                       DESC
  s.homepage         = "https://github.com/recruit-mp/ABKit"
  s.license          = "MIT"
  s.author           = { "Naoto Kaneko" => "n_kaneko@r.recruit.co.jp" }
  s.source           = { :git => "https://github.com/recruit-mp/ABKit.git", :tag => s.version.to_s }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.source_files     = "ABKit/**/*.{h,swift}"
end
