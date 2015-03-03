class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor
 
  ### Split to array:
  def split_to_array(string)
    string.split(',').map(&:strip)
  end

  def apppend_to_messages(message)
    self.messages << message
  end

  def remove_filtered_messages(owner)
    Filter.find_by(user_id: owner.id).messages.update_all(processor_id: nil) unless Filter.find_by(user_id: owner.id).messages.nil?
  end  

  def self.analyze_tweets(owner)
    @filters = Filter.where(user_id: owner.id)
    @messages = Message.where(owner_id: owner.id)
    
    owner.messages.each do |message|
      owner.filters.each do |filter|
        @slips = filter.split_to_array(filter.slips)
      
        if @slips.any? { |slip| message.body.include?(slip) } && Filter.find(filter.id).messages.exclude?(message)

          filter.apppend_to_messages(message)
          message.append_to_slipped(@slips)
          #Message.find_all_by(message.id).slipped << @slips 
          
        end

      end 
    end
      


  end
  
  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips 

end
