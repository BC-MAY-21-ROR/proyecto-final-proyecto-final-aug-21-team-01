FactoryBot.define do
    factory :user do
      email{Faker::Internet.email}
      password{Faker::Internet.password}
      factory :free_user do
        role{:free}
      end
      factory :premium_user do
        role{:premium}
      end
      factory :superadmin_user do
        role{:superadmin}
      end
    end
  end
