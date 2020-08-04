require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
   @address = FactoryBot.build(:address)
  end

  describe '配送先新規登録' do
    context '配送先登録がうまくいくとき' do
      it "配送先の全ての項目に正しい値であれば新規登録できる" do
        expect(@address).to be_valid
      end
      it "building_nameが空でも新規登録できる" do
        @address.building_name = ""
        expect(@address).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @address.postal_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが半角数字でないと登録できない" do
        @address.postal_code = "１２３ー４５６７"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Input half-width numbers contain hyphen")
      end
      it "postal_codeにハイフンがないと登録できない" do
        @address.postal_code = "1234567"
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid. Input half-width numbers contain hyphen")
      end
      it "prefecture_idが空だと登録できない" do
        @address.prefecture_id = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1だと登録できない" do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空だと登録できない" do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberにが半角数字でないと登録できない" do
        @address.phone_number = "０９０１２３４５６７８"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid. Input half-width numbers without hyphen")
      end
      it "phone_numberにハイフンが含まれると登録できない" do
        @address.phone_number = "090-1234-5678"
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid. Input half-width numbers without hyphen")
      end
    end
  end
end