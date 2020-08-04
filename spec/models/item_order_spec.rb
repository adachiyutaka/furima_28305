require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '注文新規登録' do
    context '注文新規登録がうまくいくとき' do
      it "関連モデルのレコードがあれば新規登録できる" do

        expect(@item_order).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "userが存在しないと登録できない" do
        @item_order.user = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User must exist")
      end
      it "itemが存在しないと登録できない" do
        @item_order.item = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
