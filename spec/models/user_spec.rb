require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @user = User.new
    end
    subject { @test_user.valid? }
    context 'nameカラム' do
      before do
        @test_user = @user
      end
      it '空欄でないこと' do
        @test_user.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        @test_user.name = "a"
        is_expected.to eq false;
      end
      it '10文字以下であること' do
        @test_user.name = ("a" * 11).to_s
        is_expected.to eq false;
      end
    end

    context 'emailカラム' do
      before do
        @test_user = @user
      end
      it '50文字以下であること' do
        @test_user.email = (("a" * 51).to_s) + "@gmail.com"
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
  end

  # describe 'フォローのテスト' do
  #   it 'ユーザーをフォローする' do
      
  #   end
  # end
end