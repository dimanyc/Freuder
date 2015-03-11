class User < ActiveRecord::Base

  ### Active Relations:
  has_many :filters
  has_and_belongs_to_many :messages
  has_many :filter_messages, through: :filters, class_name: 'Message'
 
  ### Validations: 
  validates :username, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true

  ### Methods:
  #### OAuth Authentication: 
  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
    user.oauth_token = auth.credentials.token
    user.oauth_secret = auth.credentials.secret
    user.save!
    user

  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.image_url = auth.info.image
      user.save 
    end
  end

  def twitter
      # $twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret, access_token: ENV['TWITTER_ACCESS_TOKEN'], access_token_secret: ENV['TWITTER_ACCESS_SECRET'] )
      $twitter ||= Twitter::REST::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret, access_token: ENV['TWITTER_ACCESS_TOKEN'], access_token_secret: ENV['TWITTER_ACCESS_SECRET'] )
  end

  # $twitter = Twitter::REST::Client.new do |config, user|
  #   config.consumer_key        = user.oauth_token
  #   config.consumer_secret     = user.oauth_secret
  #   config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  #   config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
  # end 
 

end


