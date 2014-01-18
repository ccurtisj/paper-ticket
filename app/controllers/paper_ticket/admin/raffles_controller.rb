require_dependency "paper_ticket/application_controller"

module PaperTicket
  module Admin
    class RafflesController < ApplicationController

      before_action :set_raffle, only: [:show, :edit, :update, :destroy, :generate_tickets, :draw_winner]

      # GET /raffles
      def index
        @raffles = Raffle.all
      end

      # GET /raffles/1
      def show
        respond_to do |format|
          format.html
          format.pdf do
            @tickets = @raffle.tickets.available_to_print.limit(10)
            Ticket.in(id: @tickets.collect(&:id)).update_all(printed: true) unless (params[:dry_run] == 'true')

            render pdf: 'file',
              show_as_html: (params[:debug] == 'true'),
              no_background: false,
              page_size: 'Letter',
              :margin => {
                :top                => 0,                     # default 10 (mm)
                :bottom             => 0,
                :left               => 0,
                :right              => 0
              }
          end
        end
      end

      # GET /raffles/new
      def new
        @raffle = Raffle.new
      end

      # GET /raffles/1/edit
      def edit
      end

      # POST /raffles
      def create
        @raffle = Raffle.new(raffle_params)

        if @raffle.save
          redirect_to [:admin, @raffle], notice: 'Raffle was successfully created.'
        else
          render action: 'new'
        end
      end

      # PATCH/PUT /raffles/1
      def update
        if @raffle.update(raffle_params)
          redirect_to [:admin, @raffle], notice: 'Raffle was successfully updated.'
        else
          render action: 'edit'
        end
      end

      def generate_tickets
        @raffle.generate_tickets!(params[:num_tickets].to_i)
        redirect_to admin_raffle_path(@raffle)
      end

      def draw_winner
        winner = @raffle.draw_winner!
        flash = winner ? "Winner is #{winner.name}" : "No winner found!"
        redirect_to admin_raffle_path(@raffle, winner_id: winner.id, notice: flash)
      end

      # DELETE /raffles/1
      def destroy
        @raffle.destroy
        redirect_to admin_raffles_url, notice: 'Raffle was successfully destroyed.'
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_raffle
          @raffle = Raffle.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def raffle_params
          params.require(:raffle).permit(:title, :description, :starts_at, :ends_at)
        end
    end
  end
end