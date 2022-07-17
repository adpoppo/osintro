FactoryBot.define do
  factory :comment do
    text {Faker::Internet.password(max_length: 600)}

    association :user
    association :post
  end
end
