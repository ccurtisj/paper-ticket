require_dependency "paper_ticket/application_controller"

module PaperTicket
  module Admin
    class RafflesController < ApplicationController

      before_action :set_raffle, only: [:show, :edit, :update, :destroy, :generate_tickets]

      # GET /raffles
      def index
        @raffles = Raffle.all
      end

      # GET /raffles/1
      def show
        respond_to do |format|
          format.html
          format.pdf do
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
          redirect_to @raffle, notice: 'Raffle was successfully created.'
        else
          render action: 'new'
        end
      end

      # PATCH/PUT /raffles/1
      def update
        if @raffle.update(raffle_params)
          redirect_to @raffle, notice: 'Raffle was successfully updated.'
        else
          render action: 'edit'
        end
      end

      def generate_tickets
        @raffle.generate_tickets!(params[:num_tickets].to_i)

        # put flash message
        redirect_to admin_raffle_path(@raffle)
      end

      # DELETE /raffles/1
      def destroy
        @raffle.destroy
        redirect_to raffles_url, notice: 'Raffle was successfully destroyed.'
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