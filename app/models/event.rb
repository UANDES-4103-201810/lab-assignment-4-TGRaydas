class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets
  validate :validate_place
  validate :validate_date
  def validate_date
    if Date.today > self.start_date
      errors.add(:start_date, "Event has start")
      puts "Event HAS START"
    end
  end
  def validate_place
    place = Event.where(place_id: self.place, start_date: self.start_date).first
    if !place.nil?
      errors.add(:place, "Place for event is used for this date")
      puts "DATE USED"
    end
  end
end