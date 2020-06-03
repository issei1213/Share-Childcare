require 'rails_helper'

RSpec.describe BabysittersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET new" do
    let(:babysitter) { create(:babysitter) }
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

  describe "POST create" do
    let(:babysitter) { create(:babysitter) }
    let(:babysitter_attributes){ attributes_for(:babysitter)}
    context "log in" do
      before do
        login user
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        post :create, params: { babysitter: babysitter_attributes }
        babysitter = Babysitter.last
        expect(response).to redirect_to(babysitter_path(babysitter.user_id))
      end
      # it "インスタンス変数を確認する" do
      #   expect(assigns(:babysitter)).to be_a_new(Babysitter)
      # end
    end
  end

  describe "GET edit" do
    context "log in" do
      let(:babysitter) { create(:babysitter) }
      before do
        login user
        get :edit, params: { id: babysitter }
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





