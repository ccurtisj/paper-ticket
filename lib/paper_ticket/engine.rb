require 'formtastic'
require 'formtastic-bootstrap'
require 'slim'
require 'wicked_pdf'

module PaperTicket
  class Engine < ::Rails::Engine
    isolate_namespace PaperTicket

    engine_name 'paper_ticket'

    config.generators do |g|
	    g.orm             :mongoid
	    g.template_engine :slim
	    g.test_framework  :rspec
	  end
  end
end
