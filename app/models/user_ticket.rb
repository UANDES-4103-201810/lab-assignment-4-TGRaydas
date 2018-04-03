class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validate :validate_date_event_for_ticket
  validate :validate_user_payment
  def validate_date_event_for_ticket
    ticket = Ticket.find(self.ticket_id)
    event = Event.find(ticket.event_id)
    if event.start_date < Date.today
      errors.add(:place, "The event has started")
      puts "The event has started"
    end
  end
  def validate_user_payment
    ticket = UserTicket.where(user: self.user_id, paid: false).first
    if ticket
      errors.add(:place, "You have an unpaid Ticket")
      puts "You have an unpaid Ticket"

    end
  end
end

