module PaperTicket
  module Admin
    class TicketsController < ApplicationController

      def sent
        ticket = Ticket.find(params[:id])
        ticket.sent_at = Time.now
        ticket.save!(validate: false)
        redirect_to admin_raffle_path(ticket.raffle)
      end
    end
  end
end
