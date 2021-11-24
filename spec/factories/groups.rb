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
    category
    association :owner, factory: :user
    factory :group_with_participants do
      transient do
        participants_count {5} 
      end
      after(:build) do | group , evaluator|
        group.participating_users = build_list(
        :participant,
        evaluator.participants_count,
          group: group,
          role: 1
        )
      end
    end
    

  end
end
