class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor
  
  ### Set columns to Array data type: 
  after_save :slips_to_array


  ### Validations:
  validates :name, :slips, presence: true

  # def slips= stuff
  #   serialized_slips = stuff.split(', ')
  # end

  def slips_to_array
    slips.split(', ')
    self.save
  end

end
