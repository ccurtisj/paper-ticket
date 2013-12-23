module PaperTicket
  class TicketsController < ApplicationController

  	def create
  		@raffle = Raffle.find(params[:raffle_id])

  		ticket_params = params[:ticket]

  		@ticket = @raffle.tickets.where(token: ticket_params[:token]).first

  		if @ticket
        if @ticket.claimed?
          flash.now['alert'] = "Ticket: \"#{@ticket.token}\" already claimed."
        elsif @ticket.claim!(ticket_params)
          redirect_to raffle_ticket_path(@raffle, @ticket.token) and return
        end
  		else
        @ticket = Ticket.new
  			flash.now['alert'] =  "No ticket found with code: \"#{ticket_params[:token]}\". Please check your ticket and try again."
  		end


  		render 'paper_ticket/raffles/show'
		end

    def show
      @ticket = Ticket.find_by(token: params[:id])
      @raffle = @ticket.raffle
    end
  end
end
