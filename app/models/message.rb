class Message < ActiveRecord::Base

  ### Active Relations:
  belongs_to :owner, polymorphic: true
  belongs_to :processor, polymorphic: true

  ### Validations:
  validates :body, presence: true, length: { within: 3...156, too_long: "body is too long", too_short: "body is too short" }
  validates :author, presence: true


  ### Class methods
  def self.refresh_tweets(owner)
    tweets = @@twitter.home_timeline
    if tweets
      tweets.each do |tweet|
        

        owner.messages.create!(body: tweet.full_text, author: tweet.user.screen_name, author_image_url: tweet.user.profile_image_uri.to_s, mentions: tweet.user_mentions.to_s, hashtags: tweet.hashtags.to_s)

      end
    end
  end

end
