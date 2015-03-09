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
        message_body = message.body_to_array(message)#message.body.downcase.gsub(/[^a-z0-9\s]/i, '').split(" ")

        if slips.all?{ |slip| message_body.include?(slip) } && filter.messages.exclude?(message)
          filter.messages << message
          message.slipped << slips
        else
          puts "something went wrong"
        end

      end
    end

    # user.filters.each do |filter|
    #   user.messages.each do |message|

    #     # if 1+1=2 
    #     #   return true
    #     # else
    #     #   return false
    #     # end
    #     # slips = filter.split_to_array(filter.slips)
    #     # if slips.all?{ |slip| message.body.include?(slip) } && filter.messages.exclude?(message)
    #     #   filter.messages.create(message)
    #     #   message.update_attributes(slips)
    #     #   return true
    #     # else
    #     #   return false
    #     # end

    #   end
    # end

  end

  def remove_filtered_messages(user)
    Filter.find_by(user_id: user.id).messages.delete_all  #change this for the join table
  end

end
