require 'rails_helper'

RSpec.describe User, type: :model do
  it "should create a User with valid parameters" do
    user = FactoryGirl.build(:valid_user)
    expect(user).to be_valid
  end
   it "should not create a user with invalid parameters" do
     user =FactoryGirl.build( :invalid_user)
    expect(user).not_to be_valid
  end
end
