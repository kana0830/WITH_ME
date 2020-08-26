require 'rails_helper'

RSpec.describe Favorite, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    before do
      @favorite = FactoryBot.build(:favorite)
    end
    subject { @favorite.valid? }
    context 'user_idカラム' do
      it '空欄でないこと' do
        @favorite.user_id = ''
        is_expected.to eq false;
      end
    end

    context 'gelande_idカラム' do
      it '空欄でないこと' do
        @favorite.gelande_id = ''
        is_expected.to eq false;
      end
    end
  end
end
