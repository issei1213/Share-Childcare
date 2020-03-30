require 'rails_helper'

RSpec.describe SignupsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #step1" do
    context "log not in" do
      before do
        get :step1
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :step1
      end
    end
    context "log in" do
      before do
        login user
        get :step1
      end
      it "Viewに推移する事を確認" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET #step2" do
    context "log not in" do
      before do
        get :step2
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :step2
      end
    end
    context "log in" do
      before do
        login user
        get :step2
      end
      it "Viewに推移する事を確認" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET #new" do
    context "log in" do
      before do
        get :new
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :new
      end
    end
    context "not log in" do
      before do
        get :new
        login user
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :new
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "POST #create" do
    context "log in  & when user is valid" do
      before do
        login user
      end
      it "Viewに推移する事を確認" do
        post :create, params: { user: FactoryBot.attributes_for(:user) } 
        expect(response).to redirect_to root_path
      end
    end
    context "not log in  & when user is valid" do
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to render_template :create
      end
      it "モデルの増減することを確認" do
        expect{ post :create, params: { user: FactoryBot.attributes_for(:user) } }.to change(User, :count).by(1)
      end
    end
    context "log in  & when user is invalid" do
      before do
        login user
      end
      it "Viewに推移する事を確認" do
        post :create, params: { user: FactoryBot.attributes_for(:user, nickname: nil)}
        expect(response).to redirect_to root_path
      end
    end
    # バリデーションエラーになりテスト不可
    # context "not log in  & when user is invalid" do
    #   it "Viewに推移する事を確認" do
    #     post :create, params: { user: FactoryBot.attributes_for(:user, nickname: nil)}
    #     expect(response).to render_template :new
    #   end
    #   it "モデルの増減しないことを確認" do
    #     expect{ post :create, params: { user: FactoryBot.attributes_for(:user, nickname: nil) } }.not_to change(User, :count)
    #   end
    # end
  end

end