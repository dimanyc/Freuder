class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor
 
  ### Serialize to array:
  serialize :slips, Array if changed?
  

  ### Validations:
  validates :name, :slips, presence: true

end
