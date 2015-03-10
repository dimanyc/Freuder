class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
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
        message_body = message.body_to_array(message)

        if slips.all? { |slip| message_body.include?(slip) } && filter.messages.all? { |filtered_message| filtered_message.tweet_id.exclude?message.tweet_id }
          filter.messages << message 
        end

      end
    end

  end

  def remove_filtered_messages(user)
    Filter.find_by(user_id: user.id).messages.delete_all  #change this for the join table
  end

end
