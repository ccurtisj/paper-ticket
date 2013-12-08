PaperTicket::Engine.routes.draw do

	resources :raffles, only: [:show]

	namespace :admin do
	  resources :raffles do
	  	member do
	  		post :generate_tickets
	  	end
	  end
	end
end
