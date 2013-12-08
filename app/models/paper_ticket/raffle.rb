module PaperTicket
  class Raffle
    include Mongoid::Document

    field :title, 				type: String
    field :description, 	type: String
    field :starts_at, 		type: DateTime
    field :ends_at, 			type: DateTime

    validates_presence_of :title

    has_many :tickets, class_name: 'PaperTicket::Ticket'


    def generate_tickets!(num=1)
    	num.times.each do
	    	self.tickets.build.save!(validate: false)
	    end
    end
  end
end
