# # 'Test' mode swtich:
# OmniAuth.config.test_mode = true

# # Mock authentication:
# OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#   :provider => 'twitter',
#   :uid => '123545',
#   :info => {
#     :nickname => "foobaritto"
#     :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
#   }
#     # etc.
# })

module OmniAuthTestHelper
  def valid_twitter_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        :provider => 'twitter',
        :uid => '123545',
        :info => {
          :nickname => "foobaritto",
          :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png"
        }
          # etc.
      })
    end
  end
end