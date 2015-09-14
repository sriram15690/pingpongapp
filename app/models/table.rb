class Table < ActiveRecord::Base
  has_many :bookings
  validates :number, presence: true, uniqueness: true
end
