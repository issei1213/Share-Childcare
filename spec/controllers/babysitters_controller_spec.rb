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
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :new
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:babysitter)).to be_a_new(Babysitter)
      end
    end
  end
  describe "GET edit" do
    context "log in" do
      before do
        login user
        get :edit, params: { id: babysitter }
        babysitter = create(:babysitter)
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :edit
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:babysitter)).to eq babysitter
      end
    end
  end
end





