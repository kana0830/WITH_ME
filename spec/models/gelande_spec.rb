require 'rails_helper'

RSpec.describe Gelande, "モデルに関するテスト", type: :model do

  describe 'バリデーションのテスト' do
    before do
      @gelande = FactoryBot.build(:gelande)
    end
    subject { @gelande.valid? }
    context 'postalカラム' do
      it '空欄でないこと' do
        @gelande.postal = ''
        is_expected.to eq false;
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        @gelande.address = ''
        is_expected.to eq false;
      end
    end
    context 'telカラム' do
      it '空欄でないこと' do
        @gelande.tel = ''
        is_expected.to eq false;
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        @gelande.introduction = ''
        is_expected.to eq false;
      end
    end
    context 'nameカラム' do
      it '空欄でないこと' do
        @gelande.name = ''
        is_expected.to eq false;
      end
      it '一意であること' do
        gelande = Gelande.create(name: 'ゲレンデ')
        gelande1 = Gelande.create(name: 'ゲレンデ')
        expect(gelande1).not_to be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Reviewモデルとの関係' do
      it '1:Nとなっている' do
        expect(Gelande.reflect_on_association(:reviews).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Gelande.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Gelande.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    context 'Scheduleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Gelande.reflect_on_association(:schedules).macro).to eq :has_many
      end
    end
  end

end