FactoryBot.define do
  factory :post do
    after(:build) do |post|
      post.post_images.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end

    title { Faker::Lorem.characters(number: 40) }
    content { Faker::Internet.password(max_length: 1000) }
    category_id { Faker::Number.between(from: 1, to: 16) }
    link { Faker::Internet.url }

    association :user
  end
end
