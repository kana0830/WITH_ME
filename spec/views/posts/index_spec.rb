RSpec.describe "投稿のテスト", type: :view do
  describe "投稿ページのテスト" do
    context "表示の確認" do
      before do
        visit new_user_session_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit posts_path
      end
      it 'みんなの投稿が表示される' do
        expect(page).to have_content 'みんなの投稿'
      end
    end
  end
end