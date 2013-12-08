require_dependency "paper_ticket/application_controller"

module PaperTicket
  class RafflesController < ApplicationController

  	def show
  		@raffle = Raffle.find(params[:id])
  	end
  end
end