
Pod::Spec.new do |s|
  s.name        = "ArrayDiff"
  s.version     = "2.0"
  s.summary     = "ArrayDiff quickly computes the difference between two arrays, works great with UITableView/UICollectionView"
  s.homepage    = "https://github.com/riteshhgupta/ArrayDiff://github.com/Adlai-Holler/ArrayDiff"
  s.license     = { :type => "MIT" }
  s.authors     = { "Ritesh Gupta" => "rg.riteshh@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/riteshhgupta/ArrayDiff.git", :tag => "2.0" }
  s.source_files = "ArrayDiff/*.swift"
end
