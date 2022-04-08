FactoryBot.define do
  factory :group do
    name {Faker::Company.name}
    description {Faker::Company.catch_phrase}
    public {false}
  end
end
