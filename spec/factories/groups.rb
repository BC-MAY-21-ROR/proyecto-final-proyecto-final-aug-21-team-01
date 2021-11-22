# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  amount      :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :group do
    name{Faker::App.name}
    description{Faker::Lorem.paragraph}
    amount{Faker::Number.decimal(l_digits: 2)}
  end
end
