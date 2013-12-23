module PaperTicket
  class Ticket
    include Mongoid::Document
    include Mongoid::Timestamps
    # include Mongoid::Token

    field :token,       type: String
    field :name,        type: String
    field :email,       type: String
    field :winner,      type: Mongoid::Boolean, default: false
    field :printed,     type: Mongoid::Boolean, default: false
    field :claimed_at,  type: DateTime
    field :won_at,       type: DateTime

    belongs_to :raffle, class_name: 'PaperTicket::Raffle'

    validates_uniqueness_of :token
    validates_presence_of :name, :email, :raffle_id, :token

    before_create :set_token

    scope :winners, where(winner: true)
    scope :ready_for_draw, ->(raffle) { ne(email: nil, winner: true).lt(claimed_at: raffle.ends_at) }
    scope :printed, where(printed: true)
    scope :unclaimed, where(email: nil)
    scope :unprinted, where(printed: false)

    def claimed?
      self.email.present?
    end

    def claim!(opts)
      self.update(
        email: opts[:email],
        name: opts[:name],
        claimed_at: Time.now
      )
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