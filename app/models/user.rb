class User < ActiveRecord::Base

  #Validations: 
  validates :username, :uid, presence: true 

end
