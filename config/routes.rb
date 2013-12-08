PaperTicket::Engine.routes.draw do

	resources :raffles, only: [:show] do
		resources :tickets do
			collection do
				post :register
			end
			member do
				get :registered
			end
	  end
	end

	namespace :admin do
	  resources :raffles do
	  	member do
	  		post :generate_tickets
	  	end
	  end
	end
end
