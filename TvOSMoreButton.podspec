Pod::Spec.new do |s|
  s.name = 'TvOSMoreButton'
  s.authors = { 'Chris Goldsby' => 'cgoldsby@gmail.com' }
  s.version = '2.0.0'
  s.license = 'MIT'
  s.summary = 'tvOS \'... More\' Button'
  s.homepage = 'https://github.com/cgoldsby/TvOSMoreButton'
  s.source = { :git => 'https://github.com/cgoldsby/TvOSMoreButton.git', :tag => s.version }
  s.tvos.deployment_target = '9.0'
  s.source_files = 'Source/**/*.swift'
  s.resource_bundle = { 'TvOSMoreButton' => ['Resources/*.lproj'] }
end
