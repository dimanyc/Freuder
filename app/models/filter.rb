class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  #has_many :messages, as: :processor
  has_and_belongs_to_many :messages

  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips   
 
  ### Split to array:
  def split_to_array(string)
    string.split(',').map(&:strip)
  end

  def analyze_tweets(user)
   
    user.messages.each do |message|
      user.filters.each do |filter|
        slips = filter.split_to_array(filter.slips)
        if slips.any?{ |slip| message.body.include?(slip) }

          filter.messages << message unless filter.messages.ids.include?(message.id)
          filter.save
          message.slipped << slips 
          message.save

        end
      end
    end

  end

  def remove_filtered_messages(user)
    Filter.find_by(user_id: user.id).messages.delete_all  #change this for the join table
  end

end
