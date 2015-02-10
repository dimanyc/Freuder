FactoryGirl.define do
  factory :message do
    sequence(:body) { |n| "Obama, at a news conference with the German Chancellor, he hasn’t decided whether to provide weapons to Ukraine http://nyti.ms/1CMAB2222228#{n}" }
    sequence(:author) { |n| "foo#{n}" }
    sequence(:author_image_url) { |n| "https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEY#{n}_bigger.jpeg" }
  end

end
