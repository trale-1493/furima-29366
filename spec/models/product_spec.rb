require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の新規登録' do
    it "カラムの情報が揃っていれば新規登録に成功する" do
        expect(@product).to be_valid
    end
  end
end
