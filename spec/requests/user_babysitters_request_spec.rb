require 'rails_helper'

RSpec.describe "UserBabysitters", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/user_babysitters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
