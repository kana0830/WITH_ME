require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.build(:user)
    end
    subject { @user.valid? }

    context 'nameカラム' do
      it '空欄でないこと' do
        @user.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        @user.name = "a"
        is_expected.to eq false;
      end
      it '10文字以下であること' do
        @user.name = ("a" * 11).to_s
        is_expected.to eq false;
      end
    end

    context 'emailカラム' do
      it '50文字以下であること' do
        @user.email = (("a" * 51).to_s) + "@gmail.com"
        is_expected.to eq false
      end
    end

    context 'お気に入りゲレンデ' do
      it '選択できるのは3つ以下であること' do
        FactoryBot.create(:gelande)
        FactoryBot.create(:gelande)
        FactoryBot.create(:gelande)
        FactoryBot.create(:gelande)
        @user.gelande_ids = [1,2,3,4]
        is_expected.to eq false
        expect(@user.errors[:base]).to include("お気に入りゲレンデを選択できるのは3つまでです。")
      end
    end
  end

end