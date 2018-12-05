Pod::Spec.new do |s|
  s.name         =  'Objective-LevelDB'
  s.version      =  '2.1.5'
  s.license      =  'MIT'
  s.summary      =  'A feature-complete wrapper for LevelDB in Objective-C.'
  s.description  =  'This is a feature-complete wrapper for Google\'s LevelDB. LevelDB is a fast key-value store written by Google.'
  s.homepage     =  'https://github.com/trthtai/Objective-LevelDB'
  s.authors      =  'Steven Zhang'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source       =  { :git => 'https://github.com/trthtai/Objective-LevelDB.git', :tag => s.version.to_s, :submodules => true }
  
  s.preserve_path = "db", "port", "table", "util"
  s.xcconfig = {
    'CC'  => 'clang',
    'CXX' => 'clang++',
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/leveldb-library/" "${PODS_ROOT}/leveldb-library/include"',
    'OTHER_LDFLAGS' => '-lc++'
  }
  
  s.header_dir = "leveldb"
  s.source_files = [
	"Classes/*.{h,m,mm}",
    "db/*.{cc}",
    "port/*.{cc}",
    "table/*.{cc}",
    "util/*.{cc}",
    "include/leveldb/*.h"
  ]

  s.exclude_files = [
    "**/*_test.cc",
    "**/*_bench.cc",
    "port/win"
  ]

  s.requires_arc = false
end
