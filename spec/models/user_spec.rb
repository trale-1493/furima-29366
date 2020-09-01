require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  after do
    
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
      @user.password = Faker::Name.initials(number: 9)
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
    it "ユーザー本名の名字がそれぞれ必須であること" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名の名前がそれぞれ必須であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名の苗字は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.family_name = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name must use only hull characters")
    end
    it "ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = Faker::Name.first_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name must use only hull characters")
    end

    it "ユーザー本名のフリガナの名字がそれぞれ必須であること" do
      @user.family_name_cana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name cana can't be blank")
    end
    it "ユーザー本名のフリガナの名前がそれぞれ必須であること" do
      @user.first_name_cana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name cana can't be blank")
    end

    it "ユーザー本名の苗字のフリガナは全角（カタカナ）で入力させること" do
      @user.family_name_cana = @user.family_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name cana must use only hull Cana characters")
    end
    it "ユーザー本名のの名前フリガナは全角（カタカナ）で入力させること" do
      @user.first_name_cana = @user.first_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name cana must use only hull Cana characters")
    end

    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end