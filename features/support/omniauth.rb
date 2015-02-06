# 'Test' mode swtich:
OmniAuth.config.test_mode = true

# Mock authentication:
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => 'twitter',
  :uid => '123545',
  :info => {
    :nickname => "foobaritto"
    }
    # etc.
})

