Pod::Spec.new do |spec|
  spec.name         = "PBTimeline"
  spec.version      = "0.0.1"
  spec.summary      = "Swift Timeline"
  spec.description  = "Swift Timeline for your project"
  spec.homepage     = "https://github.com/pabloblancog/PBTimeline"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "pabloblancog" => "pabloblancogonzalez@gmail.com" }
  spec.platform     = :ios, "11.0"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/pabloblancog/PBTimeline.git", :tag => "#{spec.version}" }
  spec.source_files  = "PBTimeline/PBTimeline/**/*.{swift}"
  spec.resources = 'PBTimeline/PBTimeline/**/*.{xcassets,xib,json}'
  spec.resource_bundles = {
    'PBTimeline' => [
    'PBTimeline/Assets/Localization/**/*.strings'
    ]
  }
  spec.static_framework = true
  spec.dependency 'PBUtils'
  spec.dependency 'MKRingProgressView'
end
