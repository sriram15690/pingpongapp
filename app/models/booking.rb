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

end
