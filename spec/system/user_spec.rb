require 'rails_helper'

RSpec.describe "User", type: :system do
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'user[name]', with: 'テスト太郎'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録する'

          expect(page).to have_content 'アカウント登録が完了しました。'
        end
        it '新規登録に失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button '登録する'

          expect(page).to have_content '5 件のエラーが発生したため ユーザー情報 は保存されませんでした。'
        end
      end
    end
    describe 'ユーザーログイン' do
      let(:user) { create(:user) }
      before do
        visit new_user_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          login(user)
          expect(page).to have_content 'ログインしました。'
        end

        it 'ログインに失敗する' do
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          click_button 'Log in'

          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end

  describe 'ユーザーのテスト' do
    let(:user) { create(:user) }
    # let!(:test_user) { create(:user) }
    # let!(:book) { create(:book, user: user) }
    before { login(user) }
    describe 'マイページのテスト' do
      context '表示の確認' do
        it 'マイページと表示される' do
          expect(page).to have_content('マイページ')
        end
        it '画像が表示される' do
          expect(page).to have_css('img.attachment.user.image.fallback')
        end
        it '名前が表示される' do
          expect(page).to have_content(user.name)
        end
        it '編集リンクが表示される' do
          visit user_path(user)
          expect(page).to have_link '', href: edit_user_path(user)
        end
      end
    end

    describe '編集のテスト' do
      context '編集画面への遷移' do
        it '遷移できる' do
          visit edit_user_path(user)
          expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
        end
      end
      context '表示の確認' do
        before do
          visit edit_user_path(user)
        end
        it 'プロフィール編集と表示される' do
          expect(page).to have_content('プロフィール編集')
        end
        it '名前編集フォームに自分の名前が表示される' do
          expect(page).to have_field 'user[name]', with: user.name
        end
        it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
          expect(page).to have_field 'user[email]', with: user.email
        end
        it '年齢選択フォームに自分の年齢が表示される' do
          expect(page).to have_field 'user[age]', with: user.age
        end
        it '自己紹介編集フォームに自分の自己紹介が表示される' do
          expect(page).to have_field 'user[introduction]', with: user.introduction
        end
        it '編集に成功する' do
          click_button '更新'
          expect(page).to have_content 'プロフィールを更新しました'
          expect(current_path).to eq('/users/' + user.id.to_s)
        end
        it '編集に失敗する' do
          fill_in 'user[name]', with: ''
          click_button '更新'
          expect(page).to have_content 'エラーが発生したため ユーザー情報 は保存されませんでした'
          expect(current_path).to eq('/users/' + user.id.to_s)
        end
      end
    end

    describe '一覧画面のテスト' do
      before do
        visit users_path
        @test_user = FactoryBot.create(:user)
      end
      context '表示の確認' do
        it '仲間を見つけようと表示される' do
          expect(page).to have_content('仲間を見つけよう')
        end
        it '自分と他の人の名前が表示される' do
          expect(page).to have_content user.name
          expect(page).to have_content @test_user.name
        end
      end
    end
    describe '詳細画面のテスト' do
      before do
        @test_user = FactoryBot.create(:user)
        visit user_path(@test_user)
      end
      context '表示の確認' do
        it 'ユーザーネームが表示される' do
          expect(page).to have_content "#{@test_user.name} さん"
        end
      end
    end
  end
end