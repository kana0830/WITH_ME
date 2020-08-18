# require 'rails_helper'

# describe '投稿管理機能', type: :system do
#   describe '一覧表示機能' do
#     before do
#       user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
#       FactoryBot.create(:post, title: '最初の投稿', user: user_a)
#     end

#     context 'ユーザーAがログインしているとき' do
#       before do
#         visit login_path
#         fill_in 'メールアドレス', with: 'a@example.com'
#         fill_in 'パスワード', with: 'password'
#         click_button 'Log in'
#       end

#       it 'ユーザーAが作成した投稿が表示される' do
#         expect(page).to have_content '最初のタスク'
#       end
#     end
#   end
# end
require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe '投稿のテスト' do
    let(:user) { create(:user) }
    let!(:user2) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let!(:post2) { create(:post, user: user2) }
    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
  end
  describe "投稿ページのテスト" do
    context "表示の確認" do
      before do
        get posts_path
      end
      it 'みんなの投稿が表示される' do
        expect(page).to have_content('みんなの投稿が表示される')
      end
    end
  end

end