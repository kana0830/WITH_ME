require 'rails_helper'

RSpec.describe Review, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    before do
      @review = FactoryBot.build(:review)
    end
    subject { @review.valid? }
    context 'starカラム' do
      it '空欄でないこと' do
        @review.star = ''
        is_expected.to eq false;
      end
    end
    context 'titleカラム' do
      it '空欄でないこと' do
        @review.title = ''
        is_expected.to eq false;
      end
    end
    context 'reviewカラム' do
      it '空欄でないこと' do
        @review.review = ''
        is_expected.to eq false;
      end
    end
  end
end
