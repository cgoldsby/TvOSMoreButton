Pod::Spec.new do |s|
  s.name = 'ExpandingDescriptionView'
  s.authors = { 'Chris Goldsby' => 'cgoldsby@gmail.com'}
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'tvOS Description View with \'... More\' text which presents a fullscreen Description View Controller'
  s.homepage = 'https://github.com/cgoldsby/ExpandingDescriptionView'
  s.source = { :git => 'https://github.com/cgoldsby/ExpandingDescriptionView.git', :tag => s.version }
  s.tvos.deployment_target = '9.0'
  s.source_files = 'ExpandingDescriptionView/Source/**/*.swift'
  s.resource_bundle = { 'ExpandingDescriptionView' => 'ExpandingDescriptionView/Resources/**/*' }
end
