$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paper_ticket/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paper_ticket"
  s.version     = PaperTicket::VERSION
  s.authors     = ["Christopher Curtis"]
  s.email       = ["ccurtisj@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PaperTicket."
  s.description = "TODO: Description of PaperTicket."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
end
