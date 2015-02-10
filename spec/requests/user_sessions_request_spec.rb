require 'spec_helper'
#require 'omni_auth_test_helper'

describe "GET '/auth/twitter/callback 123'" do 

  before(:each) do
    valid_twitter_login_setup
    get "auth/twitter/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should parse user id" do
    expect(:uid).to eq(User.last.uid)
  end

end
