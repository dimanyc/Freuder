FactoryGirl.define do
  factory :user do

    username 'DimaNYC'
    email 'abc@bar.com'
    uid '123123'
    provider 'twitter'
    image_url 'https://pbs.twimg.com/profile_images/558793827993911297/Fo7GFEYR_bigger.jpeg'

    trait :user_2 do 
      username 'FooBar'
      email 'ab234c@bar.com'
      uid '123123423'
      provider 'twitter'
      image_url 'https://pbs.twimg.com/profile_images/55879234234911293/Fo7GFEYR_bigger.jpeg'
    end

      trait :user_3 do
      username 'Test'
      email 'test@schmest.com'
      uid '123321263'
      provider 'twitter'
      image_url 'https://pbs.twimg.com/profile_images/53213234231326875/Fo7GFEYR_bigger.jpeg'   
    end
    
  end

end


