FactoryBot.define do
  factory :post do
    after(:build) do |post|
      post.post_image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end

    title { Faker::Lorem.characters(number: 40) }
    content { Faker::Internet.password(max_length: 1000) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    link { Faker::Internet.url }
    tag { Faker::Name.name }

    association :user
  end
end
