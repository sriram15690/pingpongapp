require 'rails_helper'

describe "Bookings" do
  it "should be able to visit Bookings Index Page without login" do
    visit bookings_path
    expect(page).to have_content 'New Booking'
    expect(page).to have_content 'Bookings List'
    expect(page).to have_selector('table tr')
  end
  
  it "should not allow user to Create new Booking without log in",:js =>true do
    visit bookings_path
    click_link "New Booking"
    expect(page).to have_content 'Log in'
  end
  
  it "should allow user to Create new blog after log in" do
    visit bookings_path
    click_link "Sign up"
    fill_in "Email", :with => "user_#{rand(1000)}@example.com"
    fill_in "user[password]", :with => "12345678"
    fill_in "user[password_confirmation]", :with => "12345678"
    click_button "Sign up"
    click_link "New Booking"
    expect(page).to have_content 'New Booking'
    fill_in "booking_start_time", :with => (Time.now + rand(1000).minutes).strftime("%d/%m/%Y %H:%M")
    fill_in "booking_duration", :with => rand(10..60)
    click_button("Submit")
    expect(page).to have_content "Bookings List"
  end
end
