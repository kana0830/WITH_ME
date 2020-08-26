require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @post = FactoryBot.build(:post)
    end
    subject { @post.valid? }
    context 'titileカラム' do
      it '空欄でないこと' do
        @post.title = ''
        is_expected.to eq false;
      end
    end

    context 'postカラム' do
      it '空欄でないこと' do
        @post.post = ''
        is_expected.to eq false;
      end
    end
  end

end