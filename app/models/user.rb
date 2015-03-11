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
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.update(
      oauth_token: auth.credentials.token,
      oauth_secret: auth.credentials.secret,
      username: auth.info.nickname,
      image_url: auth.info.image
    )
    user
  end

  def twitter
      @twitter ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_API_KEY']
        config.consumer_secret     = ENV['TWITTER_API_SECRET']
        config.access_token        = oauth_token
        config.access_token_secret = oauth_secret
      end 
  end

end


