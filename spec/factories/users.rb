FactoryGirl.define do
  factory :user do

    username { Faker::Internet.user_name }
    email { Faker::Internet.disposable_email }
    uid '123123'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEYR_bigger.jpeg'

    username { Faker::Internet.user_name }
    email { Faker::Internet.disposable_email }
    uid '1231312'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/5593827993911297/Fo7GERRG_bigger.jpeg'

    username { Faker::Internet.user_name }
    email { Faker::Internet.disposable_email }'
    uid '3243212'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/5234234323911297/Fo4rErRf_bigger.jpeg'    
    
  end

  factory :dup_user do

    username 'DimaNYC'
    email 'abc@bar.com'
    uid '123123'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEYR_bigger.jpeg'

    username 'DimaNYC'
    email 'abc@bar.com'
    uid '123123'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEYR_bigger.jpeg'
    
  end


end
