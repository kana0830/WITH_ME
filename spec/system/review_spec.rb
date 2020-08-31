require 'rails_helper'

RSpec.describe "Review", type: :system do
  describe 'クチコミ画面のテスト' do
    before do
      user = FactoryBot.create(:user)
      @gelande = FactoryBot.create(:gelande)
      @review = FactoryBot.create(:review)
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    context '一覧画面のテスト' do
      before do
        visit gelande_reviews_path(@gelande)
      end
      it 'ゲレンデ名が表示される' do
        expect(page).to have_content @gelande.name
      end
      it '口コミタイトルが表示される' do
        expect(page).to have_content @review.title
      end
      it '口コミ評価が表示される' do
        expect(page).to have_content @review.star
      end
      it '口コミ本文が表示される' do
        expect(page).to have_content @review.review
      end
    end
    context 'クチコミ投稿のテスト' do
      before do
        visit gelande_reviews_path(@gelande)
      end
      subject { @review.valid? }
      it 'クチコミ投稿に成功する' do
        @review = FactoryBot.create(:review)
        is_expected.to eq true
      end
      it 'クチコミ投稿に失敗する' do
        @review = Review.create(title: "")
        is_expected.to eq false
      end
    end
  end
end