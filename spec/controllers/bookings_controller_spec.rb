require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!
   def teardown                                         
    Warden.test_reset!                                 
  end  
  
  let(:user) { FactoryGirl.create(:valid_user) }
  
  before :each do
    sign_out :user
  end

  it "can access index without login" do
      #sign_in user
      get :index 
      expect(response).to have_http_status(200)
      expect(response).to be_success
      expect(response).to render_template("index")
  end
  
  it "cannot access new  without login" do
      sign_in nil
      get :new, {}
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).not_to be_success
      expect(response).not_to render_template("new")
      expect(response).to redirect_to(new_user_session_path)
  end
  
  it "can access new  after login" do
      sign_in user
      get :new, {}
      expect(response).to have_http_status(200)
      expect(response).to be_success
      expect(response).to render_template("new")
  end
end
