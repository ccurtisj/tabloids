Gem::Specification.new do |s|
  s.author = 'Christopher Curtis'
  s.name = "tabloids"
  s.summary = "A no-hassle Mongoid blog engine for Rails."
  s.description = "A no-hassle Mongoid blog engine for Rails."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile"]
  s.version = "0.0.1"

  # s.add_dependency "rails", ">= 3.2.8"
  s.add_dependency "rails", "~> 4.0.2"

  s.add_dependency('haml')
  s.add_dependency "mongoid"
  s.add_dependency('responders')
  s.add_dependency('mongoid-simple-tags')
end