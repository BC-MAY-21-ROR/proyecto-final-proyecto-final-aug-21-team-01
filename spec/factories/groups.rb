FactoryBot.define do
  factory :group do
    name{Faker::App.name}
    description{Faker::Lorem.paragraph}
    amount{Faker::Number.decimal(l_digits: 2)}
  end
end
