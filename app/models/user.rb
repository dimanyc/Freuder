class User < ActiveRecord::Base

  ### Active Relations:
  has_many :filters
  has_many :messages, as: :owner

  ### Validations: 
  validates :username, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: true

  ### Methods:
  #### OAuth Authentication: 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.image_url = auth.info.image
      user.save
    end

  end

end


