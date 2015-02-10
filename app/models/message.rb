class Message < ActiveRecord::Base

# Set columns as Array: 
serialize :slipped, Array
serialize :hashtags, Array
serialize :mentions, Array


end
