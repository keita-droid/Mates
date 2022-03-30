FactoryBot.define do
  factory :user do
    name {Faker::Artist.name}
    status {nil}
    description {nil}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
