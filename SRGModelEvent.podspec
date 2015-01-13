
Pod::Spec.new do |s|

  s.name         = "SRGModelEvent"
  s.version      = "0.0.2"
  s.summary      = "SRGModelEvent is thin wrapper library of NSNotification to observe/notify your model more easily."
  s.homepage     = "https://github.com/soragoto/SRGModelEvent"
  s.license      = "MIT"
  s.author       = { "Norihiro Sakamoto" => "nori0620@gmail.com" }
  s.source       = { :git => "https://github.com/soragoto/SRGModelEvent.git", :tag => "0.0.2" }
  s.platform     = :ios, '6.0'
  s.source_files = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true

end
