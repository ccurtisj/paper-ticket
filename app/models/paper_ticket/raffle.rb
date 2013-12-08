module PaperTicket
  class Raffle
    include Mongoid::Document

    field :title, 				type: String
    field :description, 	type: String
    field :starts_at, 		type: DateTime
    field :ends_at, 			type: DateTime

    validates_presence_of :title
  end
end
