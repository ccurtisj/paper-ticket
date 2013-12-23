PaperTicket::Engine.routes.draw do

	resources :raffles, only: [:show] do
		resources :tickets
	end

	namespace :admin do
	  resources :raffles do
	  	member do
	  		post :generate_tickets
	  		post :draw_winner
	  	end
	  end
	end
end
