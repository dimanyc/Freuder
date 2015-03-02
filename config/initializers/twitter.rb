@twitter = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_API_KEY']
  config.consumer_secret     = ENV['TWITTER_API_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
end


# TWITTER_API_KEY=gsrp95ZrYl09Twsu6CixoCz6G
# TWITTER_API_SECRET=0ME90XGPeFK1cdrTdrRUpqhYtCG6SkdKnjH9bL8u9Vtu7pDgTy
# TWITTER_ACCESS_TOKEN=59153881-wFDKfvAhAZ9Pvkmynzt2V8HkPzPukk7pLYia13vPV
# TWITTER_ACCESS_SECRET=oKrpXG98DGzrR1jxsKrXphYzRbJdIK2gKhOoCgI9AmOEq
