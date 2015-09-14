class User < ActiveRecord::Base
   has_many :bookings
  validates :email, presence: true, uniqueness: true
end
