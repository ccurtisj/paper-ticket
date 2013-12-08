module PaperTicket
  class Ticket
    include Mongoid::Document
    # include Mongoid::Token

    field :token
    field :name
    field :email

    belongs_to :raffle, class_name: 'PaperTicket::Raffle'

    validates_uniqueness_of :token
    validates_presence_of :name, :email, :raffle_id

    before_create :set_token

    def claimed?
      self.email.present?
    end

    def claim!(opts)
      self.update(email: opts[:email], name: opts[:name])
    end


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