FactoryBot.define do
  factory :post do
    text {Faker::Hobby.activity}
    association :user
    association :genre
  end
end
