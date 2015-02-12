require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

#   OmniAuth.config.test_mode = true

#   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#     :provider => 'twitter',
#     :uid => '123545'
#     # etc.
#   })

#   def login(mock_login)
#       strategy = mock_login[:strategy]
#       OmniAuth.config.add_mock(strategy.to_sym, mock_login[:data])
#       get "/auth/#{provider.to_s}"
#       request.env['omniauth.env'] = OmniAuth.config.mock_auth[strategy.to_sym]
#       get "/auth/#{provider.to_s}/callback"
#   end

#   login_data = {
#     provider: 'twitter',
#     data: {
#         uid: '12345'
#     }
# }


  describe "OAuth authenticaion via GET '/auth/twitter/callback' works" do 

    before(:each) do
      valid_twitter_login_setup
      get "auth/twitter"
      post "auth/twitter/callback"
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end

    it "should set user_id" do
      expect(session[:user_id]).to eq(User.last.id)
    end

    it "should parse user id" do
      expect(User.last.uid).to eq(1235456)
    end

    it "should parse user's profile_image_url" do 
      expect(User.last.image_url).to eq("http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png")
    end

    it "should " do 
      
    end

  end

end
