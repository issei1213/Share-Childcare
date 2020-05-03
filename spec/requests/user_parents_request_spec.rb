require 'rails_helper'

RSpec.describe "UserParents", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/user_parents/show"
      expect(response).to have_http_status(:success)
    end
  end

end
