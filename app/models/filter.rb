class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor
 
  ### Serialize to array:
  def split_to_array(string)
    string.split(',').map(&:strip)
  end  
  
  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips 

end
