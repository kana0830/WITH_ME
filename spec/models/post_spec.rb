require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @post = Post.new
    end
    subject { @test_post.valid? }
    context 'titileカラム' do
      before do
        @test_post = @post
      end
      it '空欄でないこと' do
        @post.title = ''
        is_expected.to eq false;
      end
    end

    context 'postカラム' do
      before do
        @test_post = @post
      end
      it '空欄でないこと' do
        @post.post = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end

end