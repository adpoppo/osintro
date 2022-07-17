FactoryBot.define do
  factory :user do
    after(:build) do |user|
      user.avatar_image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end

    nickname {Faker::Lorem.characters(number: 20)}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    profile {Faker::Lorem.paragraph}
  end
end