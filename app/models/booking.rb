class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :table
  validates :user, presence: true
  validates :table, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :duration, :numericality => { :greater_than_or_equal_to => 10, :less_than_or_equal_to => 60, :message => "Duration Should be Betweem 10 & 60 minutes"}
  validate  :minimum_time_gap_for_user
  validate :overlapping_booking_check

  attr_accessor :duration

  before_validation :set_end_time

  def booking_duration
    ((self.end_time - self.start_time)/60).to_i
  end

  def set_end_time
      self.end_time = self.start_time + self.duration.to_i.minutes
  end

  def minimum_time_gap_for_user
    puts "*******************************".inspect
    puts self.user.inspect
    puts "*******************************".inspect
    # Need Table & User data of a Booking to do this custom validaton.
   if (self.user.bookings.where("end_time >= ? ", (self.start_time - 60.minutes)).count > 0)
      errors.add :start_time, "Need a  Minimum Interval of 1 hour between two bookings for the same user."
   end
  end

  def overlapping_booking_check
    if (Booking.where("table_id = ? AND (start_time <= ? and end_time >= ?)", self.table_id, self.end_time, self.start_time).count > 0)
      errors.add :start_time, "Table is not available in the given time interval."
    end

  end
end