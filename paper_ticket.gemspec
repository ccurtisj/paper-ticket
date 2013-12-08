$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paper_ticket/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paper-ticket"
  s.version     = PaperTicket::VERSION
  s.authors     = ["Christopher Curtis"]
  s.email       = ["ccurtisj@gmail.com"]
  s.homepage    = "http://github.com/ccurtisj/paper-ticket"
  s.summary     = "Rails engine for managing sweet raffles."
  s.description = "Backed by Mongoid."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "slim-rails"
end
