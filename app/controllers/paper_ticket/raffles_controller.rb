module PaperTicket
  class RafflesController < ApplicationController

  	def show
  		@raffle = Raffle.find(params[:id])
  		@ticket = Ticket.new
  	end
  end
end