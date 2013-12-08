module PaperTicket
  class Ticket
    include Mongoid::Document
    # include Mongoid::Token

    field :token

    belongs_to :raffle

    validates_uniqueness_of :token

    before_create :set_token

    private

    def set_token
    	self.token = new_token
    end

    def new_token
    	token = (Digest::SHA2.new << "#{Time.now} #{Ticket.count}").to_s
    	token[(token.length - 6)..token.length].upcase
    end
  end
end