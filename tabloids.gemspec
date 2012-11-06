Gem::Specification.new do |s|
  s.name = "tabloids"
  s.summary = "A no-hassle Mongoid blog engine for Rails."
  s.description = "A no-hassle Mongoid blog engine for Rails."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile"]
  s.version = "0.0.1"
  
  s.add_dependency "rails", "~> 3.2.8"
  
  s.add_dependency('haml')
  s.add_dependency('mongoid', '>= 3.0')
  s.add_dependency('responders')
  s.add_dependency('mongoid-simple-tags')
end