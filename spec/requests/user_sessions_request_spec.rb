require 'spec_helper'

describe "OAuth authenticaion via GET '/auth/twitter/callback' works" do 

  before(:each) do
    valid_twitter_login_setup
    get "auth/twitter/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should parse user id" do
    expect(User.last.uid).to eq("1235456")
  end

  it "should parse user's profile_image_url" do 
    expect(User.last.image_url).to eq("http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png")
  end

  it 'should parse the username' do
    expect(User.last.username).to eq("foobaritto")
  end

end