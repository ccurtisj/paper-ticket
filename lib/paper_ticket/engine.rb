require 'slim'

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
