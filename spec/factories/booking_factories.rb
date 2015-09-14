FactoryGirl.define do
  factory :user do
    email "sampleuser@example.com"
    password "12345678"
  end
  factory :valid_user, :class => :user do
    email {"user_#{rand(1000).to_s}@example.com"}
    password "12345678"
  end
  factory :table do
    number 6
  end
  
  factory :valid_booking1 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "02/09/2017 20:00"
    f.duration 15
  end
  
  factory :invalid_booking_less_duration , :class =>:booking do
    table_id 1
    user_id 1
    start_time "02/09/2015 20:00"
    duration 5
  end
  
  factory :invalid_booking_more_duration , :class =>:booking do
    table_id 1
    user_id 1
    start_time "02/09/2015 20:00"
    duration 75
  end
  
  factory :invalid_booking_without_user , :class =>:booking do
    table_id 1
    user_id ""
    start_time "02/09/2015 20:00"
    duration 75
  end
  
  factory :invalid_booking_without_table , :class =>:booking do
    table_id ""
    user_id 1
    start_time "02/09/2015 20:00"
    duration 75
  end
  
  factory :valid_booking_now , :class =>:booking do
    table_id 1
    user_id 1
    start_time Time.now + 20.days
    duration 30
  end
  
  factory :invalid_booking_overlap_time , :class =>:booking do
    table_id 1
    user_id 1
    start_time (Time.now + 20.days + 15.minutes)
    duration 15
  end
  
  factory :invalid_booking_less_than_min_gap_for_user , :class =>:booking do
    table_id 1
    user_id 1
    start_time (Time.now + 20.days + 20.minutes)
    duration 15
  end
  
  factory :invalid_booking__duration , :class =>:booking do
    table_id 1
    user_id 1
    start_time (Time.now + 20.days + 20.minutes)
    duration "###"
  end
end