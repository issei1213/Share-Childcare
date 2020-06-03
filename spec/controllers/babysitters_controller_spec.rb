require 'rails_helper'

RSpec.describe BabysittersController, type: :controller do
  let(:user) { create(:user) }
  let(:babysitter) { create(:babysitter) }

  describe "GET new" do
    context "log in" do
      before do
        login user
        get :new
      end
      it "Viewに推移する事を確認" do
        expect(response).to redirect_to new_babysitter_path
      end
    end
  end
end





