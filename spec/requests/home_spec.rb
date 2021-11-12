require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    it "returns http success for root path" do
      get root_url
      expect(response).to have_http_status(:success)
    end
  end

end
