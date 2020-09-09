require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '商品の購入' do
    it '必要な情報が揃っていれば購入履歴の保存ができること' do
      expect(@purchase).to be_valid
    end

    it 'クレジットカード情報が入力されていなければ購入履歴の保存ができない' do
      @purchase.token = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が入力されていなければ購入履歴の保存ができない' do
      @purchase.postal_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が未選択であれば購入履歴の保存ができない' do
      @purchase.region_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Region must be other than 1")
    end

    it '市区町村が入力されていなければ購入履歴の保存ができない' do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it '番地が入力されていなければ購入履歴の保存ができない' do
      @purchase.city_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City number can't be blank")
    end

    it '建物名は入力されていなくても購入りれきの保存ができる' do
      @purchase.building = ""
      expect(@purchase).to be_valid
    end

    it '電話番号が入力されていなければ購入りれきの保存ができない' do
      @purchase.telephone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Telephone number can't be blank")
    end

    it '郵便番号にはハイフンが必須であること' do
      @purchase.postal_code = @purchase.postal_code.gsub(/-/, '')
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code invalid format")
    end

    it '電話番号にはハイフンが不要であること。' do
      @purchase.telephone_number.insert(7, "-").insert(3, "-")
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Telephone number can't use except numbers")
    end
  end
end
