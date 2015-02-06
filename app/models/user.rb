class User < ActiveRecord::Base

  ### Validations: 
  validates :username, :uid, presence: true 

  ### Instsance methods:

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
