require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname,:family_name,:first_name,:family_kana_name,:first_kana_name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a family_name" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_kana_name" do
      user = build(:user, family_kana_name: nil)
      user.valid?
      expect(user.errors[:family_kana_name]).to include("を入力してください")
    end

    it "is invalid without a family_kana_name" do
      user = build(:user, family_kana_name: "あ")
      user.valid?
      expect(user.errors[:family_kana_name]).to include("はカタカナで入力して下さい。")
    end

    it "is invalid without a first_kana_name" do
      user = build(:user, first_kana_name:"1")
      user.valid?
      expect(user.errors[:first_kana_name]).to include("はカタカナで入力して下さい。")
    end

    it "is invalid without a first_kana_name" do
      user = build(:user, first_kana_name: nil)
      user.valid?
      expect(user.errors[:first_kana_name]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
  end
end