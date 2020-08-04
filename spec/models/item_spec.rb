require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録がうまくいくとき' do
      it "商品詳細の全ての項目に正しい値、ファイルが登録されていれば新規登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image must be attached")
      end
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが41文字以上だと登録できない" do
        @item.name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "textが空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "textが1001文字以上だと登録できない" do
        @item.text = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "including_postage_idが空だと登録できない" do
        @item.including_postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Including postage can't be blank")
      end
      it "including_postage_idが1だと登録できない" do
        @item.including_postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Including postage must be other than 1")
      end
      it "consignor_location_idが空だと登録できない" do
        @item.consignor_location_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Consignor location can't be blank")
      end
      it "consignor_location_idが1だと登録できない" do
        @item.consignor_location_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Consignor location must be other than 1")
      end
      it "ready_time_idが空だと登録できない" do
        @item.ready_time_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ready time can't be blank")
      end
      it "ready_time_idが1だと登録できない" do
        @item.ready_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ready time must be other than 1")
      end
    end
  end
end