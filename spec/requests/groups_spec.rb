require 'rails_helper'

RSpec.describe "Groups", type: :request do
  let(:group) { FactoryBot.create( :group ) }
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
    it "should create a group with valid attributes and redirect" do
      params = {
        group: group.attributes
      }
      post '/groups', params: params
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "UPDATE groups#update" do 
    it 'should update the name and redirect' do
      new_params = {
        group: {
          name: 'New Name',
          description: group.description,
          amount: group.amount
        }
      }  
      put "/groups/#{group.id}", params: new_params
      expect(response).to have_http_status(:redirect)
    end
  end
end
