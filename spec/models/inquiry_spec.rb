require 'rails_helper'

RSpec.describe Inquiry, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    before do
      @inquiry = FactoryBot.build(:inquiry)
    end
    subject { @inquiry.valid? }
    context 'nameカラム' do
      it '空欄でないこと' do
        @inquiry.name = ''
        is_expected.to eq false;
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        @inquiry.email = ''
        is_expected.to eq false;
      end
    end
    context 'messageカラム' do
      it '空欄でないこと' do
        @inquiry.message = ''
        is_expected.to eq false;
      end
    end
  end
end
