require 'rails_helper'

RSpec.describe Booking, type: :model do
  before :each do
    Booking.delete_all
  end
  it "should create a booking with valid parameters" do
    booking = FactoryGirl.build(:valid_booking1)
    expect(booking).to be_valid
  end
  
  context "should not allow to create booking with invalid durations" do
    it "should not create a booking with duration less than 10 min" do
      booking = FactoryGirl.build(:invalid_booking_less_duration)
      expect(booking).not_to be_valid
    end
    
    it "should not create a booking with duration more than 60 min" do
      booking = FactoryGirl.build(:invalid_booking_more_duration)
      expect(booking).not_to be_valid
    end  
  end
  
  context "Should have relavant associated models i.e Table & User" do
    it "should not create a booking without user" do
      booking = FactoryGirl.build(:invalid_booking_without_user)
      #expect(booking).not_to be_valid
    end  
  end
  
  it "should not be created when there is overlapping of Bookings" do
    first_booking = FactoryGirl.create(:valid_booking_now)
    second_booking = FactoryGirl.build(:invalid_booking_overlap_time)
    expect(second_booking).not_to be_valid
  end
  
  it "should not be created when the time gap between 2 bookings is less than 60 minutes for a User" do
    first_booking = FactoryGirl.create(:valid_booking_now)
    second_booking = FactoryGirl.build(:invalid_booking_less_than_min_gap_for_user)
    expect(second_booking).not_to be_valid
  end
  
    it "should set end time corectly based on Duration" do 
     booking = FactoryGirl.build(:valid_booking1)
      expect(booking.set_end_time).to eq(booking.start_time + booking.duration.minutes)
    end
end
