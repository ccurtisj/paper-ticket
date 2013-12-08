PaperTicket::Engine.routes.draw do
	namespace :admin do
	  resources :raffles
	end
end
