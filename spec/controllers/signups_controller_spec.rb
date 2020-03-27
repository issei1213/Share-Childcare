require 'rails_helper'

RSpec.describe SignupsController, type: :controller do
  let(:user) { create(:user) }
  let(:params) do
    { params: {user: attributes_for(:user)}}
  end

  describe "GET #step1" do
    before:each do
      get :step1
    end
    it "HTTPステータスが200であることを確認" do
      expect(response.status).to eq(200)
    end
    it "Viewに推移する事を確認" do
      expect(response).to render_template :step1
    end
  end

  describe "GET #step2" do
    before:each do
      get :step2
    end
    it "HTTPステータスが200であることを確認" do
      expect(response.status).to eq(200)
    end
    it "Viewに推移する事を確認" do
      expect(response).to render_template :step2
    end
  end

  describe "GET #new" do
    before:each do
      get :new
    end
    it "HTTPステータスが200であることを確認" do
      expect(response.status).to eq(200)
    end
    it "Viewに推移する事を確認" do
      expect(response).to render_template :new
    end
  end
  describe "POST #create" do
    context "when user is valid" do
      subject { post :create, params: params }
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        post :create, params
        expect(response).to render_template :create
      end
    end
  end

end