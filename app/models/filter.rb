class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  has_many :messages, as: :processor

  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips   
 
  ### Split to array:
  def split_to_array(string)
    string.split(',').map(&:strip)
  end

  def user_filters
    Filter.where(user_id: user.id)
  end


  def analyze_tweets(user)
   
    user.messages.each do |message|
      user_filters.each do |filter|
        slips = filter.split_to_array(filter.slips)
        if slips.any?{ |slip| message.body.include?(slip) }
          filter.messages << message
          message.slipped << slips 
          filter.save
          message.save
        end
      end
    end

  end

  def remove_filtered_messages(user)
    Filter.where(user_id: user.id).update_all(user_id: nil)  #change this for the join table
  end


  # def apppend_to_messages(message)
  #   self.messages << message
  # end

  # def remove_filtered_messages(owner)
  #   Filter.find_by(user_id: owner.id).messages.update_all(processor_id: nil) unless Filter.find_by(user_id: owner.id).messages.nil?
  # end  

  # def self.analyze_tweets(owner)
  #   @filters = Filter.where(user_id: owner.id)
  #   @messages = Message.where(owner_id: owner.id)
    
  #   owner.messages.each do |message|
  #     owner.filters.each do |filter|
  #       @slips = filter.split_to_array(filter.slips)
      
  #       if @slips.any? { |slip| message.body.include?(slip) } && Filter.find(filter.id).messages.exclude?(message)

  #         filter.apppend_to_messages(message)
  #         message.append_to_slipped(@slips)
          
  #       end

  #     end 
  #   end
      


  # end

end
