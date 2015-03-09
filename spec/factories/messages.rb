FactoryGirl.define do
  factory :message do
    sequence(:body) { |sequenced_number| "Obama, at a news conference with the German Chancellor, he hasn’t decided whether to provide weapons to Ukraine http://nyti.ms/1CMAB2222228#{sequenced_number}" }
    sequence(:author) { |number| "foo#{number}" }
    sequence(:author_image_url) { |sequenced_number| "https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEY#{sequenced_number}_bigger.jpeg" }
    sequence(:tweet_id) {|id| "#{id}13212"}
  end

end
