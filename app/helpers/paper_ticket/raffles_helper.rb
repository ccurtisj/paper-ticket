module PaperTicket
  module RafflesHelper

    def date_input_value(date)
      date.try(:to_formatted_s, :date_input)
    end
  end
end
