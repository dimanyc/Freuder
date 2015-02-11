class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor 

  ### Set columns to Array data type: 
  serialize :slips, Array  

  ### Validations:
  validates :name, :slips, presence: true

end
