require 'rails_helper'

RSpec.describe Schedule, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    before do
      @schedule = FactoryBot.build(:schedule)
    end
    subject { @schedule.valid? }
    context 'titleカラム' do
      it '空欄でないこと' do
        @schedule.title = ''
        is_expected.to eq false;
      end
    end
  end
end
