require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "カラムの情報が揃っていれば新規登録に成功する" do
      expect(@user).to be_valid
    end

    it "ニックネームが必須であること" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      user2 = FactoryBot.build(:user)
      user2.email = @user.email
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = @user.email.gsub(/@/,'')
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上であること" do
      @user.password = Faker::Internet.password(min_length: 2, max_length: 5)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合であること" do
      #@user.password = Faker::Name.initials(number: 9)
      @user.password = "aaaaaaaaaaaaa"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must use mixed characters")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "新規登録・ログイン共にエラーハンドリングができていること" do

    end
  end

  describe '本人情報確認' do
    it "ユーザー本名が、名字と名前がそれぞれ必須であること" do

    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do

    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do

    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do

    end

    it "生年月日が必須であること" do

    end
  end
end