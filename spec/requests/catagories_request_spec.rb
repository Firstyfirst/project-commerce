require 'rails_helper'

RSpec.describe "Catagories", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/catagories/index"
      expect(response).to have_http_status(:success)
    end
  end

end
