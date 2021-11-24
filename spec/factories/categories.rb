FactoryBot.define do
    factory :category do
      title{Faker::Name.name}
      description{Faker::Lorem.paragraph}
    end
  end
  