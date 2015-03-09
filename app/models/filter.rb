class Filter < ActiveRecord::Base
  
  ### Active Relations:
  belongs_to :user
  #has_many :messages, as: :processor
  has_and_belongs_to_many :messages

  ### Validations:
  validates :name, :slips, presence: true
  validates_uniqueness_of :slips
  #validates_uniqueness_of :messages, scope: :tweet_id
 
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
          filter.message.append_to_slipped(slips)

          # message.slipped << slips
          # message.save
          # filter.messages.each {|message| message.append_to_slipped(slips.to_s)}
          # slips.each { |slip| message.append_to_slipped(slip.to_s) }
          # filter.messages.where(id: message.id).first.slipped << slips
          # filter.messages.where(tweet_id: message.tweet_id).first.slipped << slips
        end

      end
    end

  end

  def remove_filtered_messages(user)
    Filter.find_by(user_id: user.id).messages.delete_all  #change this for the join table
  end

end
