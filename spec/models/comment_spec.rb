require 'rails_helper'

RSpec.describe Comment, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @comment = FactoryBot.build(:comment)
    end
    subject { @comment.valid? }
    context 'commentカラム' do
      it '空欄でないこと' do
        @comment.comment = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end

end