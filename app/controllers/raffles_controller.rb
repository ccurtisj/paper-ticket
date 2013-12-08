module PaperTicket
  class RafflesController < ApplicationController

  	def show
  		@raffle = Raffle.find(params[:id])
  	end
  end
end