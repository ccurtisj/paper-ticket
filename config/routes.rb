PaperTicket::Engine.routes.draw do

	resources :raffles, only: [:show]

	namespace :admin do
	  resources :raffles
	end
end
