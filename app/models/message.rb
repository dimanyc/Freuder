class Message < ActiveRecord::Base

  ### Active Relations:
  has_and_belongs_to_many :users 
  has_and_belongs_to_many :filters

  ### Validations:
  validates :body, presence: true, length: { within: 3...200, too_long: "body is too long", too_short: "body is too short" }
  validates :author, presence: true
  validates_uniqueness_of :tweet_id

  ### Class methods
  def self.pull_tweets(user)
    
    tweets = $twitter.home_timeline

    if tweets #&& tweets.all? { |tweet| Message.validate_uniqueness_of(user,tweet) }
      tweets.each { |tweet| user.messages.create(tweet_id: tweet.id, body: tweet.full_text, author: tweet.user.screen_name, author_image_url: tweet.user.profile_image_uri.to_s, mentions: tweet.user_mentions.to_s, hashtags: tweet.hashtags[0].to_s) if Message.validate_uniqueness_of(user,tweet) }
      return true
    else
      return false 
    end
  end

  def self.validate_uniqueness_of(user,tweet)
    if user.messages.pluck(:tweet_id).exclude?(tweet.id.to_s)
      return true
    else
      return false
    end
  end

  def body_to_array(message)
    message.body.downcase.gsub(/[^a-z0-9\s]/i, '').split(" ")
  end

  def self.empty_user_messages(user)
    user.messages.delete_all
  end

  def tweets
  end

end
