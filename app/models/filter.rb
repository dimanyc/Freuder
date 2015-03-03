class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor
 
  ### Split to array:
  def split_to_array(string)
    string.split(',').map(&:strip)
  end

  def remove_filtered_messages(user)
    #messages = user.messages
    Filter.where(user_id: user.id).try(:messages).update_all(processor_id: nil) unless Filter.where(user_id: user.id).messages.nil?
  end  
  
  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips 

end
