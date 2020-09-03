require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の新規登録' do
    it 'カラムの情報が揃っていれば新規登録に成功する' do
      expect(@product).to be_valid
    end

    it '画像は1枚必須であること' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @product.explain = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Explain can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態についての情報が必須であること' do
      @product.condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Condition must be other than 1')
    end

    it '配送料の負担についての情報が必須であること' do
      @product.delivery_payer_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery payer must be other than 1')
    end

    it '発送元の地域についての情報が必須であること' do
      @product.region_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Region must be other than 1')
    end

    it '発送までの日数についての情報が必須であること' do
      @product.delivery_span_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Delivery span must be other than 1')
    end

    it '価格についての情報が必須であること' do
      @product.value = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Value can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @product.value = 200
      @product.valid?
      expect(@product.errors.full_messages).to include('Value must be greater than 300')
      @product.value = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Value must be less than 9999999')
    end
  end
end
