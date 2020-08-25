require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "みんなの投稿が表示される" do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'

    expect {
      visit posts_path
      expect(page).to have_content 'みんなの投稿'
    }
  end
end