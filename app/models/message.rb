class Message < ActiveRecord::Base

  ### Active Relations:
  belongs_to :owner, polymorphic: true
  belongs_to :processor, polymorphic: true

  ### Validations:
  validates :body, presence: true, length: { within: 3...200, too_long: "body is too long", too_short: "body is too short" }
  validates :author, presence: true

  ### Class methods

  def self.pull_tweets(user)
    tweets = @@twitter.home_timeline
    if tweets
      tweets.each do |tweet|
        user.messages.create!(body: tweet.full_text, author: tweet.user.screen_name, author_image_url: tweet.user.profile_image_uri.to_s, mentions: tweet.user_mentions.to_s, hashtags: tweet.hashtags.to_s)
      end
    end
  end

  def append_to_slipped(slips)
    self.slipped << slips
  end

  # def self.refresh_tweets(owner)
  #   tweets = @@twitter.home_timeline
  #   if tweets
  #     tweets.each do |tweet|
        
  #         owner.filters.each do |filter|
  #           @slips = filter.split_to_array(filter.slips)
  #           @message_body = tweet.full_text

  #           @message = owner.messages.create!(body: tweet.full_text, author: tweet.user.screen_name, author_image_url: tweet.user.profile_image_uri.to_s, mentions: tweet.user_mentions.to_s, hashtags: tweet.hashtags.to_s)            

  #           if @slips.any? { |slip| @message_body.include?(slip) } && @message.save && filter.messages.exclude?(@message)

  #               filter.messages << @message 
  #               filter.save
  #               @message.slipped << @slips
  #               @message.save
               
  #           end

  #         end

  #       end
  #   end
  # end

  def evaluate_messages(user, messages, filters)

  end

end
