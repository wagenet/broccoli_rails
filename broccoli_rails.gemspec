$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "broccoli_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "broccoli_rails"
  s.version     = BroccoliRails::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BroccoliRails."
  s.description = "TODO: Description of BroccoliRails."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec",        "3.0.0.beta2"
  s.add_development_dependency "rspec-rails",  "3.0.0.beta2"
end
