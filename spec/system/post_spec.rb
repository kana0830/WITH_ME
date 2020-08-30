require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe '投稿画面のテスト' do
    before do
      user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    context '投稿一覧画面のテスト'do
      it "みんなの投稿が表示される" do
        visit posts_path
        expect(page).to have_content 'みんなの投稿'
      end
    end
    context '投稿詳細画面のテスト'do
      before do
        visit post_path(@post)
      end
      it "投稿タイトルが表示される" do
        expect(page).to have_content @post.title
      end
      it "投稿内容が表示される" do
        expect(page).to have_content @post.post
      end
    end
  end
end