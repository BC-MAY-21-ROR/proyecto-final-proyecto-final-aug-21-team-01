require 'rails_helper'
RSpec.describe GroupsController, type: :controller do
  let(:user) { create :user  }
  before(:each) {sign_in user}
  let(:group) { FactoryBot.create( :group_with_participants )}
  let(:category) { FactoryBot.create( :category )}
  it { should route(:get, '/groups').to(action: :index) }
  it { should route(:post, '/groups').to(action: :create) }
  it { should route(:get, '/groups/new').to(action: :new) }
  it { should route(:get, '/groups/1/edit').to(action: :edit, id: 1) }
  it { should route(:get, '/groups/1').to(action: :show, id: 1) }
  it { should route(:patch, '/groups/1').to(action: :update, id: 1) }
  it { should route(:put, '/groups/1').to(action: :update, id: 1) }
  it { should route(:delete, '/groups/1').to(action: :destroy, id: 1) }

  describe "GroupsController#create" do
    it do
      params = {
      group: group.attributes
      }
      should permit(:name, :description, :amount , :owner_id, :category_id, { :participating_users_attributes => [:user_id, :role, :id, :_destroy]} ).
      for(:create, params: params).
      on(:group)
    end
  end

  describe "GroupsController#update" do
    it do
      params = {
        id: group.id,
        group: group.attributes
      }
      should permit(:name, :description, :amount, :owner_id, :category_id, { :participating_users_attributes => [:user_id, :role, :id, :_destroy]} ).
      for(:update, params: params).
      on(:group)
    end
  end
end
