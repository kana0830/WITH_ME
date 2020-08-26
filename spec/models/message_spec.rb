require 'rails_helper'

RSpec.describe Message, "モデルに関するテスト", type: :model do
  describe 'バリデーションのテスト' do
    before do
      @message = FactoryBot.build(:message)
    end
    subject { @message.valid? }
    context 'contentカラム' do
      it '空欄でないこと' do
        @message.content = ''
        is_expected.to eq false;
      end
    end
  end
end
