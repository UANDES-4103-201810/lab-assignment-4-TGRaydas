class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets
  validates :price, numericality: {greater_than: 0}
  validate :validate_date_event_for_ticket

  def validate_date_event_for_ticket
    event = Event.find(self.event_id)
    if event.start_date < Date.today
      errors.add(:place, "Event has started")
      puts "Event has started"
    end
  end
end

