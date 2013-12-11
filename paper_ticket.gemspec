$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paper_ticket/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paper_ticket"
  s.version     = PaperTicket::VERSION
  s.authors     = ["Christopher Curtis"]
  s.email       = ["ccurtisj@gmail.com"]
  s.homepage    = "http://github.com/ccurtisj/paper-ticket"
  s.summary     = "Rails engine for managing sweet raffles."
  s.description = "Backed by Mongoid."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "formtastic"
  s.add_dependency "formtastic-bootstrap"
  s.add_dependency "mongoid", "~> 4.0.0alpha1"

  # Wait until mongoid 4 is out of beta
  # s.add_dependency "mongoid_token", '~> 2.0.0'

  s.add_dependency "sass-rails"
  s.add_dependency "slim"
  s.add_dependency "wicked_pdf"
  s.add_dependency "wkhtmltopdf-binary"

  s.add_development_dependency "slim-rails"

  s.add_development_dependency "rspec"
end
