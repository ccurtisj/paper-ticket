module PaperTicket
  class Engine < ::Rails::Engine
    isolate_namespace PaperTicket

    config.generators do |g|
	    g.orm             :mongoid
	    g.template_engine :slim
	    g.test_framework  :rspec
	  end
  end
end
