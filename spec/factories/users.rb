# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  role                   :integer          default("free")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
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
