require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "カラムの情報が揃っていれば新規登録に成功する" do
      expect(@user).to be_valid
    end

    it "ニックネームが空の場合登録に失敗する" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが空の場合登録に失敗する" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスの一意性が保たれている事。" do
      @user.save
      user2 = FactoryBot.build(:user)
      user2.email = @user.email
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスに@が含まれていない場合登録に失敗する" do
      @user.email = @user.email.gsub(/@/,'')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードがなければ入力に失敗する" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが半角英数字混合でなければ入力に失敗する" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = @user.password
      @user.valid?
      binding.pry
    end
  end
end