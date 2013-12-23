module PaperTicket
  class Raffle
    include Mongoid::Document

    field :title, 				type: String
    field :description, 	type: String
    field :starts_at, 		type: DateTime
    field :ends_at, 			type: DateTime

    validates_presence_of :title

    has_many :tickets, class_name: 'PaperTicket::Ticket'

    scope :current, -> { lte(starts_at: Time.now).gte(ends_at: Time.now) }


    def generate_tickets!(num=1)
    	num.times.each do
	    	self.tickets.build.save!(validate: false)
	    end
    end

    def draw_winner!
      self.tickets_ready_for_draw.sample.tap do |winner|
        winner.try :update, {winner: true, won_at: Time.now}
      end
    end

    def tickets_ready_for_draw
      @tickets_ready_for_draw ||= self.tickets.ready_for_draw(self)
    end
  end
end
