require 'rails_helper'

RSpec.describe "Groups", type: :request do
  let(:user) { create :user  }
  before(:each) {sign_in user}
  describe "GET groups#index" do
    it "should get index" do
      get "/groups"
      expect(response).to have_http_status(:success) 
    end
  end
  describe "GET groups#new" do
    it "returns http success" do
      get "/groups/new"
      expect(response).to have_http_status(:success) 
    end
  end
  describe "POST groups#create" do 
   
    let(:category) { FactoryBot.create(:category) }
    let(:participant) { FactoryBot.create( :user) }
    let(:params) do
      { 
        group: {
          name:  "Name",
          description: "Description",
          amount: 30,
          owner_id: user.id,
          category_id: category.id,
          participating_users_attributes: {
            0 => {
              user_id:  participant.id,
              role: :follower,
              _destroy: false
            }
          }
         }
      }
     
    end
    it "should create a group with valid attributes and redirect" do

      post '/groups', params: params
      expect(response).to redirect_to(assigns(:group))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include('Group was successfully created')

    end
  end
  describe "UPDATE groups#update" do 
    let(:category) { FactoryBot.create(:category) }
    let(:group) { FactoryBot.create(:group_with_participants, participants_count: 10) }
    let(:participant) { FactoryBot.create(:user) }
    let(:new_params) do
      { 
        group: {
          name:  "Name 2212",
          description: "Description",
          amount: 30,
          owner_id: user.id,
          category_id: category.id,
          participating_users_attributes: {
            0 => {
              user_id:  participant.id,
              role: :responsible,
              _destroy: false
            }
          }
         }
      }
    end
    it 'should update the name and redirect' do
      put "/groups/#{group.id}", params: new_params
      expect(response).to have_http_status(:redirect) 
      expect(response).to_not have_http_status(:unprocessable_entity) 
    end
  end
end
