class User < ApplicationRecord
  has_many :event_attendences, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendences


  def upcoming_events
    attended_events.where("date <= :present", {present: Time.now} )
  end

  def previous_events
    attended_events.where("date > :present", {present: Time.now})
  end
end