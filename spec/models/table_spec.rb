require 'rails_helper'

RSpec.describe Table, type: :model do
  it "should create a Table with valid parameters" do
    
    table = FactoryGirl.build(:table)
    expect(table).to be_valid
  end
   it "should  not create a Table with valid parameters" do
    table = FactoryGirl.build(:invalid_table)
    expect(table).not_to be_valid
  end
end
