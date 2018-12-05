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

  s.source_files = 'Classes/*.{h,m,mm}'
  
  s.subspec 'leveldb-library' do |df|
       df.name         =  'leveldb-library'
      df.version      =  '1.18.2'
      df.license      =  'New BSD'
      df.summary      =  'A fast key-value storage library '
      df.description  =  'LevelDB is a fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.'
      df.homepage     =  'https://github.com/google/leveldb'
      df.authors      =  'The LevelDB Authors'

      df.ios.deployment_target = '5.0'
      df.osx.deployment_target = '10.7'

      df.source       =  { 
        :git => 'https://github.com/matehat/leveldb.git', 
        :tag => 'v1.18.1'
      }

      df.requires_arc = false

      df.compiler_flags = '-DOS_MACOSX', '-DLEVELDB_PLATFORM_POSIX'

      df.preserve_path = "db", "port", "table", "util"
      df.xcconfig = {
        'CC'  => 'clang',
        'CXX' => 'clang++',
        'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/leveldb-library/" "${PODS_ROOT}/leveldb-library/include"',
        'OTHER_LDFLAGS' => '-lc++'
      }

      df.header_dir = "leveldb"
      df.source_files = [
        "db/*.{cc}",
        "port/*.{cc}",
        "table/*.{cc}",
        "util/*.{cc}",
        "include/leveldb/*.h"
      ]

      df.exclude_files = [
        "**/*_test.cc",
        "**/*_bench.cc",
        "port/win"
      ]
   end
  
  #s.dependency "leveldb-library"
  s.requires_arc = false
end
