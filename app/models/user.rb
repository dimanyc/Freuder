class User < ActiveRecord::Base

  ### Validations: 
  validates :username, :uid, presence: true 

  ### Instsance methods:
  #### Omniauth Hash: 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.image_url = auth.info.image
      user.save
    end

  end

  #### Checking to see if a record already exists in db: 
  def exists?
    User.create(from_omniauth(env["omniauth.auth"])) if User.find(session[:user_id]).exists?
  end

end
