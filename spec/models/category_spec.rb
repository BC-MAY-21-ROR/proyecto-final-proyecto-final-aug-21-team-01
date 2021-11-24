# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :string
#  group_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should have_many(:groups) }
    it { should validate_length_of(:title).is_at_least(4) }
  end
end
