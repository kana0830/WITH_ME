require 'rails_helper'

RSpec.describe "Gelande", type: :system do
  describe 'ゲレンデ画面のテスト' do
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
      it "お気に入りゲレンデを見つけようが表示される" do
        visit gelandes_path
        expect(page).to have_content 'お気に入りゲレンデを見つけよう'
      end
    end
    context '詳細画面のテスト' do
      before do
        visit gelande_path(@gelande)
      end
      it 'ゲレンデ名が表示される' do
        expect(page).to have_content @gelande.name
      end
      it '紹介文が表示される' do
        expect(page).to have_content @gelande.introduction
      end
      it '郵便番号が表示される' do
        expect(page).to have_content @gelande.postal
      end
      it '住所が表示される' do
        expect(page).to have_content @gelande.address
      end
      it '郵便番号が表示される' do
        expect(page).to have_content @gelande.tel
      end
    end
    context '口コミが表示される' do
      before do
        visit gelande_path(@gelande)
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
  end
end