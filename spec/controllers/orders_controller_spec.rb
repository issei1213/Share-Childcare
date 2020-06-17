require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:parent) { create(:parent) }

  describe "POST create" do
    let(:order) { create(:order)}
    let(:order_attributes){ attributes_for(:order)}

    context "log in" do
      # before do
      #   login user
      #   post :create, params: { order: order_attributes, parent_id: parent.id  }
      # end
      # it "Viewに推移する事を確認" do
      #   order  = Order.last
      #   expect(response).to root_path
      # end
      # it "モデルの増減することを確認" do
      #   expect{ post :create, params: { order: order_attributes }}.to change(Order, :count).by(1)
      # end
    end
  end
end
